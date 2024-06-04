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
use yii\helpers\Json;

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
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['regions'] = RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();
			$this->params['action'] = Url::toRoute('my_address/add');
			$this->params['redirect'] = Yii::$app->request->get('redirect');
			$this->params['page'] = Page::seo(['title' => Language::get('address_add')]);
			$this->params['from'] = $post->from;
			/*********************[START]JchengCustom with local**********************/
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
				$this->params['address'] = ['defaddr'=>1,'region_id'=>'284','region_name'=>'湖北省 武汉'];
				$defaultUsers = UserModel::find()->select('userid,username,real_name')
				//->where(['userid'=>5])->one();
				->where(['in','userid',[305,4,5,78]])->orderBy('userid desc')->asArray()->all();
				$this->params['defaultUsers'] = $defaultUsers;
				$defaultAddress = \common\models\AddressCustomerModel::find()->select('id,consignee,address')->orderBy(['up_time' => SORT_DESC])->offset(0)->limit(30)->asArray()->all();
				if(!empty($defaultAddress)){
					foreach($defaultAddress as $k=>$v){
						$this->params['defaultAddress'][$v['id']] = $v['consignee'];
					}
				}
				$defaultSignature = \common\models\AddressSignatureModel::find()->select('userid,signature')->orderBy(['up_time' => SORT_DESC])->offset(0)->limit(30)->asArray()->all();
				if(!empty($defaultSignature)){
					foreach($defaultSignature as $k=>$v){
						$this->params['defaultSignature'][$v['userid']] = $v['signature'];
					}
				}
				$this->params['defaultContents'] = ['开业大吉,生意兴隆','开业大吉,财源广进','开业大吉,爆款连连','订货会圆满成功'];
				$this->params['defaultconsignee'] =[
					['userid'=>'81','real_name'=>'匿名']
				] ;
 
				$addressBooks = \common\models\AddressBookModel::find()->asArray()->all();
				foreach($addressBooks as $k=>$v){
					$this->params['deliveryUsers'][$v['book_id']] = $v['consignee'];
				}
				return $this->render('../my_address.nearform.html', $this->params);
			} 
			/**********************[END]JchengCustom with local**********************/
			return $this->render('../my_address.form.html', $this->params);
		}else{
			$valid = true;
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['region_id', 'defaddr']);
			/**********************[START]JchengCustom 根据添加收货地址的落款**********************/
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
				if($post->from != 'center'){
					$consignee=$post->consignee;
					if(!$consignee){
						return Message::popWarning("*请填写收货人姓名^_^!");
					}
					$signature=$post->signature;
					if(!$signature){
						return Message::popWarning("*请填写落款签名^_^!");
					}
					$subscriber=$post->subscriber;
					if(!$subscriber){
						return Message::popWarning("*请填写订花人名称^_^!");
					}
				}
				$post->book_amount  = $post->book_amount ? $post->book_amount:10;
				$valid = false;
			}
			$model = new \frontend\models\AddressForm();
			if(!($address = $model->save($post, $valid))){
				return Message::popWarning($model->errors);
			}
			$addressServ = \common\models\AddressServModel::find()->select('consignee,address')
			->where(['and',['=', 'consignee', $post->consignee],['=', 'address', $post->address]]);
			//var_dump($addressServ->createCommand()->getRawSql());
			$oneRecord = $addressServ->asArray()->one();
			if(empty($oneRecord)){
				$addressServ = new \common\models\AddressServModel();
				$addressServ->consignee = $post->consignee;
				$addressServ->region_id = $post->region_id;
				$addressServ->region_name = $post->region_name;
				$addressServ->address = $post->address;
				$addressServ->phone_tel = $post->phone_tel;
				$addressServ->zipcode = $post->zipcode;
				$addressServ->phone_mob = $post->phone_mob;
				$addressServ->defaddr = $post->defaddr;
				$addressServ->save();
			}
			if(preg_match_all("/(蓝宝石)|(红宝石)|(银座)|(金座)|(云尚)/",$post->address,$matches)){
				/*客户表入库*/
				$customerModel = \common\models\AddressCustomerModel::find()
				->where(['like','consignee',$post->consignee])->one();	
				if(!$customerModel){
					$customerModel = new \common\models\AddressCustomerModel();
				}
				$customerModel->consignee = $post->consignee;
				$customerModel->region_id = $post->region_id;
				$customerModel->region_name = $post->region_name;
				$customerModel->address = $post->address;
				$customerModel->zipcode = $post->zipcode;
				$customerModel->phone_mob = $post->phone_mob;
				$customerModel->up_time = time();
				if(!$customerModel->save()){
					return Message::popWarning($customerModel->errors);
				}
				/*签名表入库*/
				$user = UserModel::find()->select('userid,username,real_name')->where(['username'=>$post->signature])->one();
				if(empty($user)){
					$umodel = new \frontend\models\UserRegisterForm();
					$username = $post->signature ;
					$umodel->username  = $username;
					$umodel->phone_mob = '';
					$umodel->password  =  '12345678';
					$umodel->confirmPassword = '12345678';
					$umodel->agree =1;
					$user = $umodel->register(['real_name'=>$username]);
				}
				if($user){
					$signatureModel = \common\models\AddressSignatureModel::find()
					->where(['like','signature',$post->signature])->one();	
					if(!$signatureModel){
						$signatureModel = new \common\models\AddressSignatureModel();
					}
					$signatureModel->userid = $user->userid;
					$signatureModel->signature = $post->signature;
					$signatureModel->up_time = time();
					$signatureModel->save();
				}
			}
			/**********************[END]JchengCustom with local**********************/
			return Message::popSuccess(Language::get('address_add_successed'), urldecode(Yii::$app->request->post('redirect', Url::toRoute('my_address/index'))));
		}
	}
	
	public function actionEdit()
    {
		$addr_id = intval(Yii::$app->request->get('addr_id'));
		/*********************[START]JchengCustom with local**********************/
		if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
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
			$congra = \common\models\CongratulationsModel::find()->where(['addr_id' =>$addr_id])->one();
 			$address['content'] = $congra->content;	
			$this->params['address'] = $address;
			$this->params['action'] = Url::toRoute(['my_address/edit', 'addr_id' => $addr_id]);
			$this->params['redirect'] = Yii::$app->request->get('redirect', Url::toRoute('my_address/index'));
			$this->params['page'] = Page::seo(['title' => Language::get('address_edit')]);
			/*********************[START]JchengCustom with local**********************/
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
				$defaultUsers = UserModel::find()->select('userid,username,real_name')
				//->where(['userid'=>5])->one();
				->where(['in','userid',[305,4,5,78]])->orderBy('userid desc')->asArray()->all();
				$this->params['defaultUsers'] = $defaultUsers;
				$defaultAddress = \common\models\AddressCustomerModel::find()->select('id,consignee,address')->orderBy(['up_time' => SORT_DESC])->offset(0)->limit(30)->asArray()->all();
				if(!empty($defaultAddress)){
					foreach($defaultAddress as $k=>$v){
						$this->params['defaultAddress'][$v['id']] = $v['consignee'];
					}
				}
				$defaultSignature = \common\models\AddressSignatureModel::find()->select('userid,signature')->orderBy(['up_time' => SORT_DESC])->offset(0)->limit(30)->asArray()->all();
				if(!empty($defaultSignature)){
					foreach($defaultSignature as $k=>$v){
						$this->params['defaultSignature'][$v['userid']] = $v['signature'];
					}
				}
				$this->params['defaultContents'] = ['开业大吉,生意兴隆','开业大吉,财源广进','开业大吉,爆款连连','订货会圆满成功'];
				$this->params['defaultconsignee'] =[
					['userid'=>'81','real_name'=>'匿名']
				] ;
				$this->params['contents'] =[
					['content'=>'开业大吉,生意兴隆'],
					['content'=>'开业大吉,财源广进'],
					['content'=>'开业大吉,爆款连连']
				] ;
				$addressBooks = \common\models\AddressBookModel::find()->asArray()->all();
				foreach($addressBooks as $k=>$v){
					$this->params['deliveryUsers'][$v['book_id']] = $v['consignee'];
				}
				return $this->render('../my_address.nearform.html', $this->params);
			 }
			/**********************[END]JchengCustom with local**********************/
			return $this->render('../my_address.form.html', $this->params);
		}
		else
		{
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['region_id', 'defaddr']);
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
				$valid = false;
			}else{
				$valid = true;
			}
			/*******[更新用户]***************[START]JchengCustom 根据添加收货地址的落款**********************/
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
				$consignee=$post->consignee;
				if(!$consignee){
					return Message::popWarning("*请填写收货人姓名^_^!");
				}
				$signature=$post->signature;
				if(!$signature){
					return Message::popWarning("*请填写落款签名^_^!");
				}
				$subscriber=$post->subscriber;
				if(!$subscriber){
					return Message::popWarning("*请填写订花人名称^_^!");
				}
				$model = new \frontend\models\AddressForm(['addr_id' => $addr_id]);
				if(!($address = $model->save($post, $valid))) {
					return Message::popWarning($model->errors);
				}
				if(preg_match_all("/(蓝宝石)|(红宝石)|(银座)|(金座)|(云尚)/",$post->address,$matches)){
					/*客户表入库*/
					$customerModel = \common\models\AddressCustomerModel::find()
					->where(['like','consignee',$post->consignee])->one();
					if($customerModel){
						$customerModel->consignee = $post->consignee;
						$customerModel->region_id = $post->region_id;
						$customerModel->region_name = $post->region_name;
						$customerModel->address = $post->address;
						$customerModel->phone_mob = $post->phone_mob;
						$customerModel->up_time = time();
						if(!$status = $customerModel->save()){
							return Message::popWarning($customerModel->errors);
						}
					}
					
					/*签名表入库*/
					$user = UserModel::find()->select('userid,username,real_name')->where(['username'=>$post->signature])->one();
					if(empty($user)){
						$umodel = new \frontend\models\UserRegisterForm();
						$username = $post->signature ;
						$umodel->username  = $username;
						$umodel->phone_mob = '';
						$umodel->password  = '12345678';
						$umodel->confirmPassword = '12345678';
						$umodel->agree =1;
						$user = $umodel->register(['real_name'=>$username]);
					}
					
					if($user){
						$signatureModel = \common\models\AddressSignatureModel::find()
						->where(['like','signature',$post->signature])->one();	
						if(!$signatureModel){
							$signatureModel = new \common\models\AddressSignatureModel();
						}
						$signatureModel->userid    = $user->userid;
						$signatureModel->signature = $post->signature;
						$signatureModel->up_time   = time();
						//var_dump($signatureModel);die;
						//$signatureModel->save();
						if(!$status = $signatureModel->save()){
							return Message::popWarning($signatureModel->errors);
						}
					}
					
				}
			}
			/**********************[END]JchengCustom with local**********************/
			return Message::popSuccess(Language::get('address_edit_successed'), urldecode(Yii::$app->request->post('redirect', Url::toRoute('my_address/index'))));
		}
	}
	
	public function actionSearch()
	{
		 
		/**********************[END]JchengCustom with local**********************/
		if(!Yii::$app->request->isAjax)
		{
			 
			 
		}
		else
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			//$query = OrderExtmModel::find()->select('address')->where(['like', 'consignee', $post->keyword])->orderBy(['order_id' => SORT_DESC]);
			$query = \common\models\AddressServModel::find()->select('consignee,address')->where(['like', 'consignee', $post->keyword])->orderBy(['sid' => SORT_DESC]);
			$list = $query->asArray()->all();
			return Json::encode(['code' => 0, 'msg' => '', 'count' => $query->count(), 'data' => $list]);
		}
	}
	
	
	/**
	 * 修改订单地址信息
	 */
	public function actionExtro(){
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id']);
		//var_dump($post);  
		if(!Yii::$app->request->isPost)
		{

			$this->params['action'] = Url::toRoute(['my_address/extro', 'order_id' => $post->order_id]);
			$redirect = Url::toRoute(['buyer_order/view', 'order_id' => $post->order_id]);
			$this->params['regions'] = RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();
			if($post->redirect){
				$redirect =$post->redirect;
			}
			// 获取订单模型
			$model = new \frontend\models\Buyer_orderViewForm();
			if(!($extroInfo = $model->formData($post))) {
				//die('33');
				return Message::warning($model->errors);
			}
			$this->params['whatdays'] =['生日','七夕','情人节','三八妇女节','结婚','结婚纪念日','开业'];
			//var_dump($extroInfo);die('33');
			$this->params = array_merge($this->params, ['extro_info' => $extroInfo['orderExtm'], 'redirect' => $redirect]);
			return $this->render('../my_extro.nearform.html', $this->params);
		}else{
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
				$valid = false;
			}else{
				$valid = true;
			}
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['order_id']);
			//var_dump($post);die;
			$model = new \frontend\models\ExtroForm(['order_id' => $post->order_id]);

			//$consignee = OrderExtmModel::find()->select('region_id')->where(['order_id' => $order_info['order_id']])->one();
			
			if(!($extroInfo = $model->save($post, $valid))) {
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
	public function addAdresssAndUser($realname,$phone){
		$Pinyin =  new Pinyin();
		$pinyinArr = $Pinyin->convert($subscriber);
		foreach ($pinyinArr as $pinyin) {
			$loginStr .= substr($pinyin, 0, 1);
		}
		$username  = $loginStr.'2023';	
		$model = new \frontend\models\UserRegisterForm();
		$model->username  = $username;
		$model->phone_mob = $phone_mob;
		$model->password  = '12345678';
		$model->confirmPassword='12345678';
		$model->agree =1;
		//if (!($status=$model->validate()) || !($user = $model->register(['real_name'=>trim($subscriber)]))) {
		if (!($user = $model->register(['real_name'=>trim($subscriber)]))) {
			return Message::popWarning($model->errors);
		}else{
			$post->phone_mob = $phone_mob;
			$post->userid= $user->userid;
		}	
	}
}