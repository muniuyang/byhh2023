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

use common\library\Timezone;
use common\library\Def;

/**
 * @Id OrderExportForm.php 2018.8.2 $
 * @author mosir
 */
class OrderExportForm extends Model
{
	public $errors = null;
	
	public static function download($list)
	{
		// 文件数组
		$record_xls = array();		
		$lang_bill = array(
			'order_id'		=> 'ID',
			'goods_image' 	=> '商品图片',
			'goods_name' 	=> '商品标题',
			'order_sn' 		=> '订单编号',
			'store_name' 	=> '店铺名称',
    		'consignee' 	=> '收货人(收花人)',
			'signature' 	=> '签名落款(赠花人)',
			'real_name' 	=> '买家(订花人)',
			'goods_amount' 	=> '商品售价',
    		'order_amount' 	=> '订单金额',
			'shipping_fee' 	=> '运费',
    		'payment_name' 	=> '付款方式',
			'status'		=> '订单状态',
			'add_time' 		=> '下单时间',
    		'address' 		=> '收货人地址',
			'phone_mob' 	=> '收货人电话',
			'pay_message'	=> '买家留言',
			'postscript'	=> '备注',
		);
		$record_xls[] = array_values($lang_bill);
		$folder = 'ORDER_'.Timezone::localDate('Ymdhis', Timezone::gmtime());

		$amount = $quantity = 0;
		$record_value = array();
		//var_dump($list);die;
		foreach($list as $key => $value)
    	{
			$quantity++;
			$amount += floatval($value['order_amount']);

			foreach($lang_bill as $k => $v) {
				if(in_array($k, ['add_time', 'pay_time', 'ship_time', 'finished_time'])) {
					$value[$k] = Timezone::localDate('Y/m/d H:i:s', $value[$k]);
				}
				if($k == 'address') {
					$value[$k] = '【'.$value['region_name'].'】 ' . $value[$k];
				}
				if($k == 'status') {
					$value[$k] = Def::getOrderStatus($value['status']);
					//var_dump($value[$k]);
				}
	
				$record_value[$k] = $value[$k] ? $value[$k] : '';
			}
        	$record_xls[] = $record_value;
    	}

		$record_xls[] = array('seller_name' => '');// empty line
		$record_xls[] = array('seller_name' => sprintf('订单总数：%s笔，订单总额：%s元', $quantity, $amount));
		
		//var_dump($record_xls);
		//die;
		return \common\library\Page::export([
			'models' 	=> $record_xls, 
			'fileName' 	=> $folder,
		]);
	}
}