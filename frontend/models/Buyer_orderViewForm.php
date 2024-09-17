<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace frontend\models;

use Yii;
use yii\base\Model; 

use common\models\OrderModel;
use common\models\GoodsModel;
use common\models\DepositTradeModel;
use common\models\RefundModel;
use common\models\UserModel;

use common\library\Basewind;
use common\library\Language;
use common\library\Def;

/**
 * @Id Buyer_orderViewForm.php 2018.9.19 $
 * @author mosir
 */
class Buyer_orderViewForm extends Model
{
	public $errors = null;
	
	public function formDatas($post = null){
		//$users = User::find()->where(['id' => [1, 2, 3]])->all();
		$ids = explode(',',$post->order_ids);
		//var_dump($post->order_ids);
		/**********************[START]JchengCustom with local**********************/
		$userid = Yii::$app->user->id;
		$orderInfo = OrderModel::find()->alias('o')
		->select('o.order_id,o.buyer_id,o.seller_id,o.order_amount,o.discount,o.payment_code,o.payment_name,o.pay_message,o.pay_time,
		o.ship_time,o.finished_time,o.express_no,o.postscript,o.status,o.order_sn,o.add_time as order_add_time,
		s.store_name,s.region_name,s.address,s.im_qq')
		->joinWith('store s', false)
		->joinWith('orderExtm')
		->with('orderGoods')
		->where(['o.order_id' =>$ids]);
		//var_dump($orderInfo->createCommand()->getRawSql());die;
		
		$orderInfo = $orderInfo->asArray()->all();
		/**********************[START]JchengCustom with local**********************/
		if(!($orderInfo)) {
			$this->errors = Language::get('no_such_order');
			return false;
		}
		return $orderInfo;
	}
	
	public function formData($post = null)
	{
		
		/**********************[START]JchengCustom with local**********************/
		$userid = Yii::$app->user->id;
		$Goods = [];
		if(in_array($userid,Yii::$app->params['createRights'])){
			$orderInfo = OrderModel::find()->alias('o')
			->select('o.order_id,o.buyer_id,o.seller_id,o.order_amount,o.discount,o.payment_code,o.payment_name,o.pay_message,o.pay_time,
			o.ship_time,o.finished_time,o.express_no,o.postscript,o.status,o.order_sn,o.add_time as order_add_time,
			s.store_name,s.region_name,s.address,s.im_qq')
			->joinWith('store s', false)
			->joinWith('orderExtm')
			->with('orderGoods')
			->where(['o.order_id' => $post->order_id])->asArray()->one();

			$Goods = GoodsModel::find()->select(['cate_id','cate_name'])->where(['goods_id' => $orderInfo['orderGoods'][0]['goods_id']])->asArray()->one();
			//var_dump($orderInfo);die;
		}else{
			$orderInfo = OrderModel::find()->alias('o')
			->select('o.order_id,o.buyer_id,o.seller_id,o.order_amount,o.discount,o.payment_code,o.payment_name,o.pay_message,o.pay_time,o.ship_time,o.finished_time,o.express_no,o.postscript,o.status,o.order_sn,o.add_time as order_add_time,s.store_name,s.region_name,s.address,s.im_qq')->joinWith('store s', false)->joinWith('orderExtm')->with('orderGoods')
			->where(['o.order_id' => $post->order_id, 'buyer_id' => Yii::$app->user->id])->asArray()->one();
		}
		if(!empty($Goods)){
			$orderInfo['orderGoods'][0] = array_merge($orderInfo['orderGoods'][0],$Goods);
		}else{
			$orderInfo['orderGoods'][0]['cate_id'] =0;
			$orderInfo['orderGoods'][0]['cate_name'] ='';

		}
		/**********************[START]JchengCustom with local**********************/
		if(!$post->order_id || !($orderInfo)) {
			$this->errors = Language::get('no_such_order');
			return false;
		}
		// for PC
		if(Basewind::getCurrentApp() == 'pc') {
			$orderInfo['seller_info'] = UserModel::find()->select('phone_mob')->where(['userid' => $orderInfo['seller_id']])->asArray()->one();
		}

		//var_dump($orderInfo['orderGoods']);die('2');
		
		return $orderInfo;
	}
	
	/* 是否申请过退款 - 手机端才需要 */
	public function getOrderRefund($orderInfo = array())
	{
		$tradeNo = DepositTradeModel::find()->select('tradeNo')->where(['bizIdentity' => Def::TRADE_ORDER, 'bizOrderId' => $orderInfo['order_sn']])->scalar();
		if(!empty($tradeNo) && ($refund = RefundModel::find()->select('refund_id,status')->where(['tradeNo' => $tradeNo])->one())) {
			if(in_array($refund->status, array('SUCCESS'))) {
				$orderInfo['refund_status_label'] = Language::get('refund_success');
			} elseif(!in_array($refund->status, array('CLOSED'))) {
				$orderInfo['refund_status_label'] = Language::get('refund_waiting');
			}
			$orderInfo['refund_id'] = $refund->refund_id;
		}
		return $orderInfo;
	}
}
