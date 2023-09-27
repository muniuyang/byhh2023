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
use common\models\DepositTradeModel;
use common\models\UserModel;
use common\models\OrderLogModel;

use common\library\Basewind;
use common\library\Language;
use common\library\Timezone;
use common\library\Def;;

/**
 * @Id Seller_orderAdjustfeeForm.php 2018.9.19 $
 * @author cheng
 */
class Seller_orderAdjusttimeForm extends Model
{
	public $store_id = 0;
	public $errors = null;
	
	public function formData($post = null)
	{

		$orderInfo = OrderModel::find()->alias('o')->select('o.order_id,order_sn,buyer_name,add_time,pay_time,postscript')
		->joinWith('orderExtm ex',false)->where(['o.order_id' => $post->order_id])
		//->createCommand()->getRawSql();
		->asArray()->one();
		//var_dump($post->order_id);var_dump($orderInfo);
		if(!$post->order_id || !($orderInfo)) {
			$this->errors = Language::get('no_such_order');
			return false;
		}
		if($orderInfo){
			$orderInfo['add_time'] = date('Y-m-d H:i:s',$orderInfo['add_time']);
		}
		return $orderInfo;
	}
	
	public function submit($post = null, $orderInfo = array())
	{
			
		$model = OrderModel::findOne($orderInfo['order_id']);
		$model->add_time = strtotime($post->add_time);
		if($post->postscript){
			$model->postscript = trim($post->postscript);
		}

		//die('333');
		$model->pay_alter = 1;
		if(!$model->save()) {
			$this->errors = $model->errors;
			return false;
		}

		DepositTradeModel::updateAll(['add_time' => $post->add_time, 'pay_alter' => 1], ['bizOrderId' => $orderInfo['order_sn']]);

		//写日志
		$model = new OrderLogModel();
		$model->order_id = $orderInfo['order_id'];
		if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
			$model->operator = $orderInfo['buyer_name'];
		}else{
			$model->operator = addslashes(Yii::$app->user->identity->username);
		}
		$model->order_status = Def::getOrderStatus($orderInfo['status']);
		$model->changed_status = Def::getOrderStatus($orderInfo['status']);
		$model->remark = $post->remark;
		$model->log_time = Timezone::gmtime();
		$model->save();
			
        // 发送给买家邮件通知，订单金额已改变，等待付款
		$mailer = Basewind::getMailer('tobuyer_adjust_fee_notify', ['order' => $orderInfo, 'reason' => $model->remark]);
		if($mailer && ($toEmail = UserModel::find()->select('email')->where(['userid' => $orderInfo['buyer_id']])->scalar())) {
			$mailer->setTo($toEmail)->send();
		}
		
		return true;
	}
}
