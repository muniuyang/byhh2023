<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace frontend\controllers;

use Yii;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

use common\models\AddressModel;
use common\models\RegionModel;
use common\models\OrderExtmModel;
use common\models\UserModel;

use common\library\Basewind;
use common\library\Language;
use common\library\Message;
use common\library\Resource;
use common\library\Page;
use Overtrue\Pinyin\Pinyin;
/**
 * @Id My_addressController.php 2018.4.22 $
 * @author mosir
 */

class My_addressController extends \common\controllers\BaseUserController
{
	/**
	 * 初始化
	 * @var array $view 当前视图
	 * @var array $params 传递给视图的公共参数
	 */
	public function init()
	{
		parent::init();
		$this->view  = Page::setView('mall');
		$this->params = ArrayHelper::merge($this->params, Page::getAssign('user'));
	}
	
    public function actionIndex()
    {
		//var_dump($this->params);die;
		// 取得列表数据
		$query = AddressModel::find()->where(['userid' => Yii::$app->user->id])->orderBy(['defaddr' => SORT_DESC, 'addr_id' => SORT_DESC]);
		$page = Page::getPage($query->count(), 20);
		$this->params['addressList'] = $query->offset($page->offset)->limit($page->limit)->asArray()->all();
		$this->params['pagination'] = Page::formatPage($page);
		
		$this->params['_foot_tags'] = Resource::import([
			'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js,jquery.plugins/jquery.validate.js,dialog/dialog.js,mlselection.js',
            'style' => 'jquery.ui/themes/smoothness/jquery.ui.css,dialog/dialog.css'
		]);
	
		// 当前位置
		$this->params['_curlocal'] = Page::setLocal(Language::get('my_address'), Url::toRoute('my_address/index'), Language::get('address_list'));
		
		// 当前用户中心菜单
		$this->params['_usermenu'] = Page::setMenu('my_address', 'address_list');

		$this->params['page'] = Page::seo(['title' => Language::get('address_list')]);
		return $this->render('../my_address.index.html', $this->params);
	}
	
	public function actionAdd()
    {
		if(!Yii::$app->request->isPost)
		{
			$this->params['regions'] = RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();

			$this->params['action'] = Url::toRoute('my_address/add');
			$this->params['redirect'] = Yii::$app->request->get('redirect');

			$this->params['page'] = Page::seo(['title' => Language::get('address_add')]);
			
			/*********************[START]JchengCustom with local**********************/
			if($this->params['visitor']['userid'] ==3){
				$this->params['address'] = ['region_id'=>'284','region_name'=>'湖北省 武汉'];
				return $this->render('../my_address.nearform.html', $this->params);
			}
			/**********************[END]JchengCustom with local**********************/
			
			return $this->render('../my_address.form.html', $this->params);
		}
		else
		{
			$valid = true;
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['region_id', 'defaddr']);
			/*******[注册用户]***************[START]JchengCustom 根据添加收货地址的落款**********************/
			if($post->phone_mob != '13476299284'){
				if(Yii::$app->user->id ==3){
					$valid = false;
					$Pinyin =  new Pinyin();
					$pinyinArr = $Pinyin->convert($post->signature);
					foreach ($pinyinArr as $pinyin) {
						$loginStr .= substr($pinyin, 0, 1);
					}
					$username  = $loginStr.'2023';		
					//return Message::popWarning("当前手机号:[".$phone_mob."]");
					//查看用户是否注册1
					if(!($user = UserModel::find()->where(['username' => $username,'real_name' =>trim($post->signature)])->asArray()->one())){
						/*
						$tel_arr = array(
							'130','131','132','133','134','135','136','137','138','139','144','147','150','151','152','153','155','156','157','158','159','176','177','178','180','181','182','183','184','185','186','187','188','189',
						);	
						$phone_mob = $tel_arr[array_rand($tel_arr)].mt_rand(1000,9999).mt_rand(1000,9999);//买花人默认随机生成一个
						*/
						$phone_mob = $post->phone_mob ? $post->phone_mob :''; //表单提交的是收花人手机号 更新为买花人手机号
						//查看用户是否注册2
						if($phone_mob){
							$user = UserModel::find()->where(['phone_mob' => $phone_mob])->one();
						}else{
							$user = [];
						}
						if(empty($user)){
							$model = new \frontend\models\UserRegisterForm();
							$model->username  = $username;
							$model->phone_mob = $phone_mob;
							$model->password  = '12345678';
							$model->confirmPassword='12345678';
							$model->agree =1;
							//if (!($status=$model->validate()) || !($user = $model->register(['real_name'=>trim($post->signature)]))) {
							if (!($user = $model->register(['real_name'=>trim($post->signature)]))) {
								var_dump($post);die('======END=======');
								return Message::popWarning($model->errors);
							}else{
								$post->phone_mob = $phone_mob;
								$post->userid= $user->userid;
							}	
						}else{
							$post->userid= $user->userid;
							//return Message::popWarning("手机号已被占用![".$user['phone_mob']."]");
						}
					 
					}else{
						$post->userid= $user['userid'];//var_dump($user);die('3333');
						//return Message::popWarning("用户名已被占用![".$user['username']."][".$user['real_name']."]");
					}
				}
			}
			//var_dump($post);die('======END=======');
			$model = new \frontend\models\AddressForm();
			if(!($address = $model->save($post, $valid))) {
				return Message::popWarning($model->errors);
			}
			/**********************[END]JchengCustom with local**********************/
			return Message::popSuccess(Language::get('address_add_successed'), urldecode(Yii::$app->request->post('redirect', Url::toRoute('my_address/index'))));
		}
	}
	
	public function actionEdit()
    {
		$addr_id = intval(Yii::$app->request->get('addr_id'));
       
		
		/*********************[START]JchengCustom with local**********************/
		if($this->params['visitor']['userid'] ==3){
			if(!$addr_id || !($address = AddressModel::find()->where(['addr_id' => $addr_id])->asArray()->one())) {
				return Message::warning(Language::get('no_such_address'));
			}		 
		}else{
			if(!$addr_id || !($address = AddressModel::find()->where(['addr_id' => $addr_id, 'userid' => Yii::$app->user->id])->asArray()->one())) {
				return Message::warning(Language::get('no_such_address'));
			}
		}
		/**********************[END]JchengCustom with local**********************/
		
		
		if(!Yii::$app->request->isPost)
		{
			
			
			$this->params['regions'] = RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();
			$this->params['address'] = $address;
			$this->params['action'] = Url::toRoute(['my_address/edit', 'addr_id' => $addr_id]);
			$this->params['redirect'] = Yii::$app->request->get('redirect', Url::toRoute('my_address/index'));

			$this->params['page'] = Page::seo(['title' => Language::get('address_edit')]);
			 /*********************[START]JchengCustom with local**********************/
			 if($this->params['visitor']['userid'] ==3){
				return $this->render('../my_address.nearform.html', $this->params);
			 }
			 /**********************[END]JchengCustom with local**********************/
			return $this->render('../my_address.form.html', $this->params);
		}
		else
		{
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['region_id', 'defaddr']);
			if(Yii::$app->user->id ==3){//JchengCustom
				$valid = false;
			}else{
				$valid = true;
			}
			//var_dump($post);die;
			$model = new \frontend\models\AddressForm(['addr_id' => $addr_id]);
			//$address = $model->find()->where(['addr_id' => $addr_id])->asArray()->one();
			//var_dump($address);die;
			if(!($address = $model->save($post, $valid))) {
				return Message::popWarning($model->errors);
			}
			return Message::popSuccess(Language::get('address_edit_successed'), urldecode(Yii::$app->request->post('redirect', Url::toRoute('my_address/index'))));
		}
	}
	/**
	 * 修改订单地址信息
	 */
	public function actionExtro(){
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id']);
		if(!Yii::$app->request->isPost)
		{
			$this->params['action'] = Url::toRoute(['my_address/extro', 'order_id' => $post->order_id]);
			$redirect = Url::toRoute(['buyer_order/view', 'order_id' => $post->order_id]);
			$this->params['regions'] = RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();
			
			// 获取订单模型
			$model = new \frontend\models\Buyer_orderViewForm();
			if(!($extroInfo = $model->formData($post))) {
				return Message::warning($model->errors);
			}
			//var_dump($extroInfo);die;
			$this->params = array_merge($this->params, ['extro_info' => $extroInfo['orderExtm'], 'redirect' => $redirect]);
			return $this->render('../my_extro.nearform.html', $this->params);
		}else{
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['order_id']);
			//var_dump($post);die;
			$model = new \frontend\models\ExtroForm(['order_id' => $post->order_id]);
			
			//$consignee = OrderExtmModel::find()->select('region_id')->where(['order_id' => $order_info['order_id']])->one();
			//var_dump($model); die('33333');
			if(!($extroInfo = $model->save($post, true))) {
				return Message::popWarning($model->errors);
			}
			return Message::popSuccess(Language::get('address_edit_successed'), urldecode(Yii::$app->request->post('redirect', Url::toRoute('buyer_order/view'))));
		}
	}
	public function actionDelete()
    {
        $post = Basewind::trimAll(Yii::$app->request->get(), true);
		
		$model = new \frontend\models\AddressDeleteForm(['addr_id' => $post->addr_id]);
		if(!$model->delete($post, true)) {
			return Message::warning(Language::get('drop_address_failure'));
		}
        return Message::display(Language::get('drop_address_successed'));
    }
	
	/* 三级菜单 */
    public function getUserSubmenu()
    {
        $submenus =  array(
            array(
                'name'  => 'address_list',
                'url'   => Url::toRoute('my_address/index'),
            ),
        );

        return $submenus;
    }
}