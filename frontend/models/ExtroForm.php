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
		//var_dump($post);die('33');
		
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
		$model->send_date 	= $post->send_date;//送货时间
		$model->is_year 	= $post->is_year;//年结单
		$model->is_send 	= $post->is_send;//配送状态
		if($res =preg_match_all("/订货会/",$post->content,$matches)){
			$model->is_meeting = 1;
		}else{
			$model->is_meeting = 0;	
		}
		//var_dump($post->content,$res,$matches,$model->is_meeting);
		//var_dump($model->attributes());die;
		/**********************[START]JchengCustom with local**********************/
		if(!$model->save()) {
			$this->errors = $model->errors;
			return false;
		}
		
		//修改订单的下单用户JchengCustom
		$orderM = OrderModel::find()->where(['order_id'=>$model->order_id])->one();
		$user = UserModel::find()->where(['username' =>$model->subscriber])->one();
		if(!$user) {
			$umodel = new \frontend\models\UserRegisterForm();
			$username = $post->subscriber ;
			$umodel->username  = $username;
			$umodel->phone_mob = '';
			$umodel->password  = '12345678';
			$umodel->confirmPassword = '12345678';
			$umodel->agree =1;
			$user = $umodel->register(['real_name'=>$username]);
		}
		if($orderM->buyer_id != $user->userid){
			$orderM->buyer_id = $user->userid;
			$orderM->buyer_name = $model->subscriber;
			$orderM->save();
		}
		
		/**
		 * 修改客户地址
		 */
		$customerModel = \common\models\AddressCustomerModel::find()->alias('o');
		$customerModel = $customerModel->where(['o.consignee' => $model->consignee]);
		$customerModel = $customerModel->andWhere(['like','o.add_date' , @date('Y')]);
		//var_dump($customerModel->createCommand()->getRawSql());die('33');
		$customerModel = $customerModel->one();
		if(!$customerModel){
			$customerModel = new \common\models\AddressCustomerModel();
		}
		if($res = preg_match_all("/云尚|蓝宝石|红宝石|金座|银座|老三镇|金正茂|金昌|翡翠座|小商品市场|中心商城|品牌/",$post->address,$matches)){
			$regions = ['周边','云尚','蓝宝石','红宝石','金座','银座','老三镇','金正茂','金昌','翡翠座','小商品市场','中心商城','品牌'];
			$region_no = array_search($matches[0][0], $regions);//找数组里指定值的键
			//var_dump($res,$region_no,$matches);
		}else{
			$region_no = 0;
		}
		$customerModel->consignee   = $model->consignee;
		$customerModel->region_id   = $model->region_id;
		$customerModel->region_name = $model->region_name;
		$customerModel->address = $model->address;
		$customerModel->zipcode = $model->zipcode;
		$customerModel->phone_mob = $model->phone_mob;
		$customerModel->region_no = $region_no;
		//$customerModel->add_date = @date('Y-m-d',time());
		$customerModel->up_time = time();//-8*3600;
		$customerModel->save();
		/*
		//修改用户的昵称和真实姓名
		if($user = UserModel::find()->where(['userid' =>$orderM->buyer_id])->one()) {
			$user->username  = $model->subscriber;
			$user->real_name = $model->subscriber;
			$user->save();
		}else{
			
		}
		*/
		return true;
	}
}
