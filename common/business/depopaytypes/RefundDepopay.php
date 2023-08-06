<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */
 
namespace common\business\depopaytypes;

use yii;

use common\models\RefundModel;
use common\models\RefundMessageModel;
use common\models\UserPrivModel;
use common\models\OrderModel;
use common\models\OrderLogModel;
use common\models\DepositTradeModel;

use common\library\Language;
use common\library\Timezone;
use common\library\Def;
use common\library\Plugin;

/**
 * @Id RefundDepopay.php 2018.10.18 $
 * @author mosir
 */
 
class RefundDepopay extends OutlayDepopay
{	
	/**
	 * 针对交易记录的交易分类，值有：购物：SHOPPING； 理财：FINANCE；缴费：CHARGE； 还款：CCR；转账：TRANSFER ...
	 */
	public $_tradeCat	= 'SHOPPING'; 
	
	/**
	 * 针对财务明细的交易类型，值有：在线支付：PAY；充值：RECHARGE；提现：WITHDRAW; 服务费：SERVICE；转账：TRANSFER
	 */
    public $_tradeType 	= 'TRANSFER';
	
	/**
	 * 支付类型，值有：即时到帐：INSTANT；担保交易：SHIELD；货到付款：COD
	 */
	public $_payType   	= 'SHIELD';	
	
	public function submit($data = array())
	{
        extract($data);
		
        // 处理交易基本信息
        $base_info = $this->_handle_trade_info($trade_info, false);
        if (!$base_info){
            return false;
        }
		
		//$tradeNo = $extra_info['tradeNo'];

		// 如果是在线付款的退款，走原路退回通道
		if(in_array($extra_info['payment_code'], ['alipay', 'alipay_app', 'alipay_wap', 'wxpay', 'wxmppay', 'wxapppay', 'wxh5pay', 'wxnativepay'])) {
			if(!$this->originalRefund($trade_info, $extra_info)) {
				return false;
			}
		}
		else {
			if(!$this->balanceRefund($trade_info, $extra_info)) {
				return false;
			}
		}

		// 修改退款状态，并增加退款日志
		if(!$this->_handle_refund_status($trade_info, $extra_info)) {
			return false;
		}

		// 非全额退款时，给商家支付退款差价
		if($extra_info['chajia'] > 0) {
			if(!$this->realPayGoods($trade_info, $extra_info)) {
				return false;
			}
		}
			
		// 处理订单状态
		if(!$this->_handle_order_status($trade_info, $extra_info)) {
			return false;
		}
			
		// 处理交易状态
		if(!$this->_handle_trade_status($trade_info, $extra_info)) {
			return false;
		}
		
		// 部分退款时，如果买家使用的是余额支付，则重置不可提现额度金额
		if($extra_info['chajia'] > 0 && $extra_info['payment_code'] == 'deposit') {
			parent::relieveUserNodrawal($extra_info['tradeNo'], $trade_info['party_id'], $extra_info['chajia']);
		}
		
		return true;
	}
	
	/* 修改退款状态，并增加退款日志 */
	public function _handle_refund_status($trade_info, $extra_info)
	{
		RefundModel::updateAll([
			'status' => 'SUCCESS', 
			'end_time' => Timezone::gmtime()
		], ['refund_id' => $extra_info['refund_id']]);
		
		// 判断是平台客服处理退款，还是卖家同意退款
		if(isset($extra_info['operator']) && ($extra_info['operator'] == 'admin')) 
		{
			$refund_goods_fee    = $this->post->refund_goods_fee ? round($this->post->refund_goods_fee, 2) : 0;
			$refund_shipping_fee = $this->post->refund_shipping_fee ? round($this->post->refund_shipping_fee, 2) : 0;
			$refund_total_fee    = $refund_goods_fee + $refund_shipping_fee;
			
			$content = sprintf(Language::get('admin_agree_refund_content_change'), 
								Language::get('admin'), $refund_goods_fee, $refund_shipping_fee, $this->post->content);
			
			RefundModel::updateAll(['refund_total_fee' => $refund_total_fee, 'refund_goods_fee' => $refund_goods_fee, 'refund_shipping_fee' => $refund_shipping_fee, 'intervene' => 1], ['refund_id' => $extra_info['refund_id']]);
			
			$owner_id = UserPrivModel::find()->select('userid')->where(['privs' => 'all', 'store_id' => 0])->orderBy(['userid' => SORT_ASC])->scalar();
		} 
		else 
		{
			$content = sprintf(Language::get('seller_agree_refund_content_change'), $extra_info['seller_name']);
			$owner_id = $extra_info['seller_id'];
		}
		
		// 增加退款日志
		$model = new RefundMessageModel();
		$model->owner_id = $owner_id;
		$model->owner_role = $extra_info['operator'];
		$model->refund_id = $extra_info['refund_id'];
		$model->content = $content;
		$model->created = Timezone::gmtime();
		if(!$model->save()) {
			$this->setErrors("50007");
			return false;
		}
		return true;
	}
	
	/* 退款成功过后，修改订单状态，并插入订单变更日志 */
	public function _handle_order_status($trade_info, $extra_info)
	{
		if(!isset($extra_info['order_id']) || !$extra_info['order_id'] || !OrderModel::findOne($extra_info['order_id'])) {
			$this->setErrors("50013");
			return false;
		}
		
		// 修改订单状态为，全额退款：交易关闭， 部分退款： 交易成功
		$status = $extra_info['chajia'] > 0 ? Def::ORDER_FINISHED : Def::ORDER_CANCELED;
		if(!OrderModel::updateAll(['status' => $status, 'finished_time' => Timezone::gmtime()], ['order_id' => $extra_info['order_id']])) {
			$this->setErrors("50013");
			return false;
		}
		
		// 判断是管理员处理退款，还是卖家同意退款
		if(isset($extra_info['operator']) && ($extra_info['operator'] == 'admin')) {
			$remark = Language::get('admin_agree_refund_order_status_change');
		} else $remark = Language::get('seller_agree_refund_order_status_change');

		// 记录订单操作日志
		$model = new OrderLogModel();
		$model->order_id  		= $extra_info['order_id'];
		$model->operator  		= 0;
		$model->order_status  	= Def::getOrderStatus($extra_info['status']);
		$model->changed_status 	= Def::getOrderStatus($status);
		$model->remark    		= $status == Def::ORDER_FINISHED ? Language::get('refund_success') : '';
		$model->log_time 		= Timezone::gmtime();
		if(!$model->save()) {
			$this->setErrors("50014");
			return false;
		}
		return true;
	}
	
	public function _handle_trade_status($trade_info, $extra_info)
	{
		// 修改交易记录状态为，全额退款：交易关闭， 部分退款：交易成功
		$status = $extra_info['chajia'] > 0 ? 'SUCCESS' : 'CLOSED';
		return parent::_update_trade_status($extra_info['tradeNo'], array('status' => $status, 'end_time' => Timezone::gmtime()));		
	}
	
	/**
	 * 退款到余额
	 * 针对使用站内钱包余额购物的退款 
	 */
	public function balanceRefund($trade_info, $extra_info)
	{
		// 退款给买家
		$data_record = array(
			'tradeNo'		=>	$extra_info['tradeNo'],
			'userid'		=>	$trade_info['party_id'], // 买家
			'amount'		=>  $trade_info['amount'],
			'balance'		=>	parent::_update_deposit_money($trade_info['party_id'],  $trade_info['amount']), // 增加后的余额
			'tradeType' 	=>  $this->_tradeType,
			'tradeTypeName'	=>  Language::get('trade_refund_return'),
			'flow'			=>	'income',
		);
		return parent::_insert_deposit_record($data_record, false);
	}

	/**
	 * 退款到原付款账户
	 * 通过接口实现退款原路返回
	 */
	public function originalRefund($trade_info, $extra_info)
	{
		$payment = Plugin::getInstance('payment')->build($extra_info['payment_code']);
		if(!($payment_info = $payment->getInfo()) || !$payment_info['enabled']) {
			$this->setErrors("50025");
			return false;
		}
		
		$params['amount'] = $trade_info['amount'];
		$params['total'] = DepositTradeModel::find()->where(['payTradeNo' => $extra_info['payTradeNo']])->sum('amount');
		$params['payTradeNo'] = $extra_info['payTradeNo'];
		$params['refund_sn'] = $extra_info['refund_sn'];
		
		if(!$payment->refund($params)) {
			$this->setErrors(0, $payment->errors);
			return false;
		}

		return true;
	}

	/**
	 * 如果为非全额退款，则退款差价即为支付货款
	 */
	public function realPayGoods($trade_info, $extra_info)
	{
		$data_record = array(
			'tradeNo'		=>  $extra_info['tradeNo'],
			'userid'		=>	$trade_info['userid'], // 卖家
			'amount'		=>  $extra_info['chajia'],
			'balance'		=>	parent::_update_deposit_money($trade_info['userid'],  $extra_info['chajia']), // 增加后的余额
			'tradeType' 	=>  $this->_tradeType,
			'tradeTypeName'	=>  Language::get('trade_refund_pay'),
			'flow'			=>	'income',
		);
		
		return parent::_insert_deposit_record($data_record, false);
	}
}
