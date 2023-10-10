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
	
	public static function download($list,$sheetName='')
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
			'signature' 	=> '落款(赠花人)',
			'real_name' 	=> '买家(订花人)',
			'goods_amount' 	=> '售价',
			'shipping_fee' 	=> '运费',
    		'order_amount' 	=> '金额',
    		'payment_name' 	=> '付款方式',
			'status'		=> '订单状态',
			'add_time' 		=> '下单时间',
    		'address' 		=> '收货人地址',
			'phone_mob' 	=> '收货人电话',
			'pay_message'	=> '买家留言',
			'postscript'	=> '备注',
		);
		if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
			unset($lang_bill['order_id']);unset($lang_bill['order_sn']);//unset($lang_bill['goods_image']);
			$lang_bill['goods_image'] = '图片';
		}
		
		//var_dump($lang_bill);die;
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
		
		if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
			$sheetName = $sheetName ?$sheetName.'-博艺花卉客户':'博艺花卉客户账单';
			$folder = $sheetName.Timezone::localDate('Ymdhis', Timezone::gmtime());
			return \common\library\pageOutDown::export([
				'models' 	=> $record_xls, 
				'fileName' 	=> $folder,
				'sheetName' =>$sheetName
			]);
		}else{
			return \common\library\Page::export([
			'models' 	=> $record_xls, 
			'fileName' 	=> $folder,
			]);
		}
	}
}
