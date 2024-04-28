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
use common\models\AddressModel;
use common\models\RegionModel;
use common\models\OrderExtmModel;
use common\models\UserModel;

use common\library\Basewind;
use common\library\Language;

/**
 * @Id AddressForm.php 2018.4.23 $
 * @author mosir
 */
class ExtroForm extends Model
{
	public $order_id = 0;
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
		if($valid === true && !$this->valid($post)) {
			return false;
		}

		if(!$this->order_id || !($model = OrderExtmModel::find()->where(['order_id' => $this->order_id])->one())) {
			$model = new OrderExtmModel();
		}
		
		$model->order_id 	= $post->order_id;
		$model->consignee 	= $post->consignee;
		$model->region_id 	= $post->region_id;
		$model->region_name = implode(' ', RegionModel::getArrayRegion($post->region_id));
		$model->address 	= $post->address;
		$model->zipcode 	= $post->zipcode ? $post->zipcode : '';
		$model->phone_tel	= $post->phone_tel ? $post->phone_tel : '';
		$model->phone_mob 	= $post->phone_mob;
		/**********************[START]JchengCustom with local**********************/
		$model->signature 	= $post->signature;//落款
		$model->subscriber 	= $post->subscriber;//订花人
		$model->content 	= $post->content;//祝贺语
		$model->what_day 	= $post->what_day;//祝贺语
		/**********************[START]JchengCustom with local**********************/
		if(!$model->save()) {
			$this->errors = $model->errors;
			return false;
		}
		//修改订单的下单用户JchengCustom
		$orderM = OrderModel::find()->where(['order_id'=>$model->order_id])->one();
		if($user = UserModel::find()->where(['username' =>$model->subscriber])->one()) {
			if($orderM->buyer_id != $user->userid){
				$orderM->buyer_id = $user->userid;
				$orderM->buyer_name = $model->subscriber;
				$orderM->save();
			}
		}else{
			
		}
		//修改用户的昵称和真实姓名
		if($user = UserModel::find()->where(['userid' =>$orderM->buyer_id])->one()) {
			$user->username  = $model->subscriber;
			$user->real_name = $model->subscriber;
			$user->save();
		}else{
			
		}
		//var_dump($post);
		//die('ddd');
		return true;
	}
}
