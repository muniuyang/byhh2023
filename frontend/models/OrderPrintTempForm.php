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

use common\models\OrderPrintTempModel;

use common\library\Basewind;
use common\library\Language;

/**
 * @Id OrderPrintTempForm.php 2024.5.22 $
 * @author jcheng
 */
class OrderPrintTempForm extends Model
{
	public $addr_id = 0;
	public $errors = null;

	public function valid($post)
	{
		if(empty($post->consignee)) {
			$this->errors = Language::get('consignee_required');
			return false;
		}
		if(Basewind::isPhone($post->phone_mob) == false) {
			$this->errors = Language::get('phone_mob_invalid');
			return false;
		}
		if(!$post->region_id) {
			$this->errors = Language::get('region_required');
			return false;
		}
		if(empty($post->address)) {
			$this->errors = Language::get('address_required');
			return false;
		}

		return true;
	}
	
	public function save($post, $valid = true)
	{
		//var_dump($post);die;
		if($valid === true && !$this->valid($post)) {
			return false;
		}
		$userid = Yii::$app->user->id;
		/**********************[START]JchengCustom **********************/

		if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
			$model = OrderPrintTempModel::find()->where(['id' => $this->id])->one();
		}else{
			$model = OrderPrintTempModel::find()->where(['id' => $this->id, 'userid' => $userid])->one();
		}
		/**********************[END]JchengCustom with local**********************/
		if(!$this->addr_id || !($model)) {
			$model = new OrderPrintTempModel();
		}else{
			$userid = $model->userid;
		}
		$model->userid 		= $userid;
		$model->consignee 	= $post->consignee;
		$model->region_id 	= $post->region_id;
		$model->address 	= $post->address;
		$model->zipcode 	= $post->zipcode ? $post->zipcode : '';
		$model->phone_tel	= $post->phone_tel ? $post->phone_tel : '';
		$model->phone_mob 	= $post->phone_mob;
		if(!$model->save()) {
			$this->errors = $model->errors;
			return false;
		}
		/*************添加祝贺语*********[START]JchengCustom with local**********************/
		if($post->content){
			$congra = \common\models\CongratulationsModel::find()->where(['addr_id' =>$model->addr_id])->one();
			if(!$congra){
				$congra = new \common\models\CongratulationsModel();
				$congra->addr_id = $model->addr_id;
			}
			$congra->content = $post->content;
			$congra->save();	
		}
		/**********************[START]JchengCustom with local**********************/

		if($post->defaddr) {
			AddressModel::updateAll(['defaddr' => 0], ['and', ['userid' => $userid], ['!=', 'addr_id', $model->addr_id]]);
		}
		AddressModel::setIndexAddress();
		return true;
		
	}
}
