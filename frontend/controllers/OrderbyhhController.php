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

use common\models\OrderModel;
use common\models\UserBillModel;
use common\models\DepositTradeModel;
use common\models\RefundModel;

use common\library\Basewind;
use common\library\Language;
use common\library\Message;
use common\library\Resource;
use common\library\Timezone;
use common\library\Page;
use common\library\Def;
use Overtrue\Pinyin\Pinyin;
/**
 * @Id OrderController.php 2018.8.2 $
 * @author mosir
 */

class OrderbyhhController extends \common\controllers\BaseUserController
{
	/**
	 * 初始化
	 */
	public function init()
	{
		parent::init();
		$this->view  = Page::setView('mall');
		$this->params = ArrayHelper::merge($this->params, Page::getAssign('user'));
		if(!in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
			//die("未授权，不能访问！");
		}
	}
	//http://www.byhh.com/orderbyhh/index.html
	public function actionIndex()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['limit', 'page', 'status']);
		if(!Yii::$app->request->isAjax) 
		{
			$this->params['filtered'] = $this->getConditions($post);
			$this->params['search_options'] = $this->getSearchOption();
			$this->params['status_list'] = $this->getStatus();
			$this->params['_foot_tags'] = Resource::import([
				'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js,jquery.plugins/jquery.validate.js,dialog/dialog.js,mlselection.js,user.js,jquery.plugins/jquery.form.js,inline_edit.js',
				'style' =>  'jquery.ui/themes/smoothness/jquery.ui.css,dialog/dialog.css'
			]);
			
			
			$this->params['page'] = Page::seo(['title' => Language::get('order_list')]);
			$userBills =  UserBillModel::find()->alias('b')->select('u.real_name')
			->joinWith('user u', false)
			->orderBy(['b.userid' => SORT_DESC])
			->asArray()->all();
			$temps = [''];
			if(!empty($userBills)){
				foreach($userBills  as $k => $v){
					$temps[$k] = $v['real_name'];
				}
			}
			$this->params['userBill'] = $temps;
			//var_dump($this->params);die;
			return $this->render('../order.byhhindex.html', $this->params);
		}
		else
		{
			$query = OrderModel::find()->alias('o')->select('o.order_id,o.order_sn,o.buyer_name,o.seller_name as store_name,o.goods_amount,o.order_amount,o.payment_name,o.status,o.add_time,o.pay_time,o.finished_time,
			oe.consignee,oe.signature,oe.address,oe.shipping_fee,oe.what_day,oe.send_date,oe.content,obi.real_name,og.goods_name,og.goods_image,og.goods_id,og.quantity');
			//var_dump($post);die;
			$query = $this->getConditions($post, $query);

			$query = $query->joinWith('orderExtm oe', false)
			->joinWith('orderBuyerInfo obi', false)
			->joinWith('orderGoods og', false)
			->orderBy(['o.order_id' => SORT_DESC]);
			
			//var_dump($query->createCommand()->getRawSql());die;


			$page = Page::getPage($query->count(), $post->limit ? $post->limit : 14);
			$list = $query->offset($page->offset)->limit($page->limit)->asArray()->all();

			//var_dump($list);die;
			foreach ($list as $key => $value)
			{
				$list[$key]['tradeNo'] = DepositTradeModel::find()->select('tradeNo')->where(['bizOrderId' => $value['order_sn']])->scalar();// 是否申请过退款
				$list[$key]['add_time'] = Timezone::localDate('Y-m-d H:i:s', $value['add_time']);
				$list[$key]['pay_time'] = Timezone::localDate('Y-m-d H:i:s', $value['pay_time']);
				$list[$key]['finished_time'] = Timezone::localDate('Y-m-d H:i:s', $value['finished_time']);
				$list[$key]['status'] = Def::getOrderStatus($value['status']);
				if(!empty($list[$key]['tradeNo']) && ($refund = RefundModel::find()->select('refund_id,status')->where(['tradeNo' => $list[$key]['tradeNo']])->one())) {
					$list[$key]['refund_status'] = $refund->status;
					$list[$key]['refund_id'] = $refund->refund_id;
				}else{
					$list[$key]['refund_status'] = '';
					$list[$key]['refund_id'] = '';
				}
				
			}
			return Json::encode(['code' => 0, 'msg' => '', 'count' => $query->count(), 'data' => $list]);
		}
	}
	//http://www.byhh.com/orderbyhh/create_user.html?u=吴年伟
	public function actionCuser2(){
		$post = Basewind::trimAll(Yii::$app->request->get(), true);
		var_dump($post);die;
		
	}
	
	/**
	 * 修改订单地址信息
	 */
	public function actionExtro(){
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id']);
		//var_dump($post);  
		if(!Yii::$app->request->isPost)
		{
	
			$this->params['action'] = Url::toRoute(['orderbyhh/extro', 'order_id' => $post->order_id]);
			$redirect = Url::toRoute(['orderbyhh/index', 'order_id' => $post->order_id]);
			$this->params['regions'] = \common\models\RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();
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
			if($post->from == 'send_date'){
				return $this->render('../my_extro.nearextroformdate.html', $this->params);
			}else{
				return $this->render('../my_extro.nearextroform.html', $this->params);
			}
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
			return Message::popSuccess(Language::get('address_edit_successed'), urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}
	/**
	 * 创建年结单用户
	 */
	public function actionCuser()
	{
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['action'] = Url::toRoute(['orderbyhh/extro', 'from' => 'cuser']);
			$redirect = Url::toRoute(['orderbyhh/index']);
			$this->params['regions'] = \common\models\RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();

			$this->params['address'] = ['defaddr'=>1,'region_id'=>'284','region_name'=>'湖北省 武汉'];
			$this->params = array_merge($this->params, ['redirect' => $redirect]);
			return $this->render('../order.byhhuserform.html', $this->params);
		}else{
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			if(!in_array($post->utype,[1,2])){
				return Message::popWarning("用户的类型未选择!");
			}
			if(!$post->username){
				return Message::popWarning("请输入用户名!");
			}
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom


				$usModel = \common\models\UserModel::find()->where(['or',
					['like', 'username', $post->username],
					['like', 'real_name', $post->username]
				]);
				//$sql = $usModel->createCommand()->getRawSql(); 
				$user = $usModel->one();
				if(!$user){
					$umodel = new \frontend\models\UserRegisterForm();
					$username = $post->username ;
					$umodel->username  = $username;
					$umodel->phone_mob = '';
					$umodel->password  =  $post->password;
					$umodel->confirmPassword = $post->password;
					$umodel->agree =1;
					$user = $umodel->register(['real_name'=>$username]);
					if(!$user){
						return Message::popWarning($umodel->errors);
					}
				}
				//var_dump($post);die;
				if($post->utype==1) {//年结用户
					$ubmodel = new \common\models\UserBillModel();
					$ubmodel->userid = $user->userid;
					if(!$ubmodel->save()) {
						return Message::popWarning($ubmodel->errors);
					}
				}
				if($post->address){
					$post->consignee = $post->username;
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
						$addressServ->zipcode = $post->zipcode;
						$addressServ->phone_mob = $post->phone_mob;
						$addressServ->save();
					}
				}


			}else{
				return Message::popWarning("权限不够");
			}
			return Message::popSuccess("添加成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}
	/**
	 * 创建订单配送人
	 */
	public function actionCdelivery()
	{
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$addressDelivery = \common\models\AddressDeliveryModel::find()
			->alias('o')
			->select('o.*,ab.phone_mob,ab.consignee')
			->joinWith('addressBook ab', false)
			//->with('addressBook', false)
			->where(['order_id' => $post->order_id]);
			//var_dump($addressDelivery->createCommand()->getRawSql());die;
			$addressDelivery = $addressDelivery->asArray()->one();
			//var_dump($addressDelivery);die;
			$this->params['delivery'] = $addressDelivery;
			$this->params['action'] = Url::toRoute(['orderbyhh/cdelivery','order_id' => $post->order_id, 'from' => 'address']);
			$redirect = Url::toRoute(['orderbyhh/index']);
			
			$addressBooks = \common\models\AddressBookModel::find()->asArray()->all();
			
			foreach($addressBooks as $k=>$v){
				$this->params['deliveryUsers'][$k] = $v['consignee'];
			}
			//var_dump($this->params['deliveryUsers']);die;
			$this->params['regions'] = \common\models\RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();
			$this->params = array_merge($this->params, ['redirect' => $redirect,'order_id' => $post->order_id]);
			return $this->render('../order.byhhdeliveryform.html', $this->params);
		}else{
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			if(!$post->consignee){
				return Message::popWarning("请输入配送人!");
			}
			if(!$post->amount){
				return Message::popWarning("请输入金额!");
			}
			 
			$addressDelivery = \common\models\AddressDeliveryModel::find()->where(['delivery_id'=> $post->delivery_id]);
			$addressBook = \common\models\AddressBookModel::find()
			->where(['or',['=', 'consignee', $post->consignee],['=', 'phone_mob', $post->phone_mob]]);
			//var_dump($addressBook->createCommand()->getRawSql());die;
			
			
			$addressBook = $addressBook->one();
			if(empty($addressBook)){
				$addressBook = new \common\models\AddressBookModel();
			}
			$addressBook->consignee = $post->consignee;
			if($post->phone_mob){
				$addressBook->phone_mob = $post->phone_mob;
			}
			$addressBook->save();
			//var_dump($addressBook);die;
			$addressDelivery = $addressDelivery->one();
			if(empty($addressDelivery)){
				$addressDelivery = new \common\models\AddressDeliveryModel(); 
			}
			$addressDelivery->order_id = $post->order_id;
			$addressDelivery->amount   = $post->amount ? $post->amount :10;
			$addressDelivery->book_id  = $addressBook->book_id;
			$addressDelivery->save();
			return Message::popSuccess("添加成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}
	/**
	 * 修改订单支付状态
	 */
	public function actionEditstatus()
	{
		/**********************[END]JchengCustom with local**********************/
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['action'] = Url::toRoute(['orderbyhh/editstatus', 'order_id' => $post->order_id, 'from' => 'class']);
			$redirect = Url::toRoute(['orderbyhh/index']);
			$this->params['orderExt'] = \common\models\OrderGoodsModel::find()->where(['order_id' => $post->order_id])->one();
			//var_dump($this->params['orderExt']);die;
			$this->params['orderStatus'] =[
					'11'=>'待支付',
					'0'=>'已关闭'
			];
			$this->params = array_merge($this->params, ['redirect' => $redirect,'order_id' => $post->order_id]);
			return $this->render('../order.byhheditstatusform.html', $this->params);	 	 
		}
		else
		{
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['order_id']);
			//var_dump($post);
			//die('eee');
			if(!$post->field){
				return Message::popWarning("请选择状态信息!");
			}

			//修改order
	        $order = \common\models\OrderModel::find()->where(['order_id' => $post->order_id])->one();
			//var_dump($order);die;
			 
			if(!empty($order)){
				$order->status   = 11;
				$order->payment_name = 'NULL';
				if(!$order->save()) {
					return Message::popWarning($order->errors);
				}
			}
			 
 
			//修改trade购买者
			$trade = \common\models\DepositTradeModel::find()->where(['bizOrderId' => $order->order_sn])->one();
			//var_dump($trade);die;
			 
			if(!empty($trade)){
				$trade->status = 'PENDING';//待支付
				$trade->payment_code='NULL';
				$trade->payType='SHIELD';
				$trade->fundchannel = '';
				if(!$trade->save()) {
					return Message::popWarning($trade->errors);
				}
			}
		 
		   //修改trade购买者
		   $record = \common\models\DepositRecordModel::find()->where(['tradeNo' => $trade->tradeNo])->one();
		  // var_dump($record);die;
		   if(!empty($record)){
			   $record->userid = $trade->buyer_id;
			   if(!$record->save()) {
				return Message::popWarning($record->errors);
			   }
		   }
		    
			return Message::popSuccess("编辑成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}
	/**
	 * 修改订花人信息
	 */
	public function actionEditbuyer()
	{
		/**********************[END]JchengCustom with local**********************/
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['action'] = Url::toRoute(['orderbyhh/editbuyer', 'order_id' => $post->order_id, 'from' => 'class']);
			$redirect = Url::toRoute(['orderbyhh/index']);
			$this->params['orderExt'] = \common\models\OrderGoodsModel::find()->where(['order_id' => $post->order_id])->one();
			//var_dump($this->params['orderExt']);die;
			$this->params = array_merge($this->params, ['redirect' => $redirect,'order_id' => $post->order_id]);
			return $this->render('../order.byhheditbuyerform.html', $this->params);	 	 
		}
		else
		{
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['order_id']);
			if(!$post->userid){
				return Message::popWarning("请输入用户名或用户ID!");
			}
			$query = \common\models\UserModel::find()->where(['userid'=>$post->userid]);
			//var_dump($query->createCommand()->getRawSql());die;
			$user = $query->one();
			//var_dump($list);
			//die('eee');
			//修改order购买者
	        $order = \common\models\OrderModel::find()->where(['order_id' => $post->order_id])->one();
			//var_dump($order->order_sn);die;
			if(!empty($order)){
				$order->buyer_id   = $user->userid;
				$order->buyer_name = $user->username;
				$order->buyer_email= $user->email;
				if(!$order->save()) {
					return Message::popWarning($order->errors);
				}
			}
			//修改order扩展信息
			$orderExt = \common\models\OrderExtmModel::find()->where(['order_id' => $order->order_id])->one();
			//var_dump($orderExt->order_sn);die;
			if(!empty($orderExt)){
				$orderExt->subscriber= $order->buyer_name;
				if(!$orderExt->save()) {
					return Message::popWarning($orderExt->errors);
				}
			}
			//修改trade购买者
			$trade = \common\models\DepositTradeModel::find()->where(['bizOrderId' => $order->order_sn])->one();
			//var_dump($trade);die;
			if(!empty($trade)){
				$trade->buyer_id = $order->buyer_id;
				if(!$trade->save()) {
					return Message::popWarning($trade->errors);
				}
			}
		   //修改trade购买者
		   $record = \common\models\DepositRecordModel::find()->where(['tradeNo' => $trade->tradeNo])->one();
		   //var_dump($record);die;
		   if(!empty($record)){
			   $record->userid = $trade->buyer_id;
			   if(!$record->save()) {
				return Message::popWarning($record->errors);
			   }
		   }
			return Message::popSuccess("编辑成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}
	/**
	 * 创建收货用户地址
	 */
	public function actionCaddress()
	{
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['action'] = Url::toRoute(['orderbyhh/caddress', 'from' => 'address']);
			$redirect = Url::toRoute(['orderbyhh/index']);
			$this->params['regions'] = \common\models\RegionModel::find()->select('region_name')->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();

			$this->params['address'] = ['defaddr'=>1,'region_id'=>'284','region_name'=>'湖北省 武汉'];
			$this->params = array_merge($this->params, ['redirect' => $redirect]);
			return $this->render('../order.byhhaddressform.html', $this->params);
		}else{
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			if(!$post->consignee){
				return Message::popWarning("请输入收货人!");
			}
			if(!$post->address){
				return Message::popWarning("请输入详细地址!");
			}

			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
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
					$addressServ->zipcode = $post->zipcode;
					$addressServ->phone_mob = $post->phone_mob;
					$addressServ->save();
				 }else{
					 
				 }
			}else{
				return Message::popWarning("权限不够");
			}
			return Message::popSuccess("添加成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}
	/**
	 * 创建年结单用户
	 */
	public function actionSearch()
	{
		/**********************[END]JchengCustom with local**********************/
		if(!Yii::$app->request->isAjax)
		{
			 
			 
		}
		else
		{
				
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			if($post->from == 'delivery'){
				$query = \common\models\AddressBookModel::find()
				->where(['consignee'=>$post->keyword]);
				$list = $query->one();
			}else if($post->from == 'buyerform'){
				$query = \common\models\UserModel::find()->where(['or',
					['=', 'userid', $post->keyword],
					['like', 'username', $post->keyword],
					['like', 'nickname', $post->keyword],
					['like', 'real_name', $post->keyword]
				]);
				//var_dump($query->createCommand()->getRawSql());die;
				$list = $query->all();
			}else{
				//$query = OrderExtmModel::find()->select('address')->where(['like', 'consignee', $post->keyword])->orderBy(['order_id' => SORT_DESC]);
				$query = \common\models\AddressServModel::find()->select('address')->where(['like', 'consignee', $post->keyword])->orderBy(['sid' => SORT_DESC]);
				$list = $query->asArray()->all();	
			}

			return Json::encode(['code' => 0, 'msg' => '', 'count' => $query->count(), 'data' => $list]);
		}
	}	
	/**
	 * 修改分类
	 */
	public function actionClass()
	{
		/**********************[END]JchengCustom with local**********************/
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['action'] = Url::toRoute(['orderbyhh/class', 'order_id' => $post->order_id, 'from' => 'class']);
			$redirect = Url::toRoute(['orderbyhh/index']);
			$this->params['whatdays'] = ['生日','七夕','情人节','三八妇女节','结婚','结婚纪念日','开业'];
			$this->params['orderExt'] = \common\models\OrderExtmModel::find()->where(['order_id' => $post->order_id])->one();
			
			$this->params = array_merge($this->params, ['redirect' => $redirect,'order_id' => $post->order_id]);
			return $this->render('../order.byhhclassform.html', $this->params);	 	 
		}
		else
		{
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['order_id']);
			$orderExt =\common\models\OrderExtmModel::find()->where(['order_id' => $post->order_id]);
			//var_dump($orderExt->createCommand()->getRawSql());die;
			$orderExt = $orderExt->one();
			//var_dump($orderExt);die;
			$orderExt->what_day = $post->what_day;
			if(!$orderExt->save()) {
				return Message::popWarning($orderExt->errors);
			}
			return Message::popSuccess("编辑成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}	
	/**
	 * 修改订单价格
	 */
	public function actionEditcol()
	{
		$get = Basewind::trimAll(Yii::$app->request->get(), true);
	 
		if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
			if(in_array($get->column, ['order_amount'])) {
				$params = (object) array();
				$params->order_id = $get->id;
 				$params->{$get->column} = $get->value;
				$model = new \frontend\models\Seller_orderAdjustfeeForm(['store_id' => $this->visitor['store_id']]);
				if(!($orderInfo = $model->formData($params))) {		
					return Message::warning($model->errors);
				}
			}
			if(!$model->submit($params, $orderInfo)) {
				return Message::popWarning($model->errors);
			}
			return Message::display(Language::get('edit_ok'));
		}else{
			return Message::popWarning("权限不够");
		}
	}
	/**
	 * 修改订单商品信息
	 */
	public function actionEditgood()
	{
		/**********************[END]JchengCustom with local**********************/
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['action'] = Url::toRoute(['orderbyhh/editgood', 'order_id' => $post->order_id, 'from' => 'class']);
			$redirect = Url::toRoute(['orderbyhh/index']);
			$this->params['orderExt'] = \common\models\OrderGoodsModel::find()->where(['order_id' => $post->order_id])->one();
			//var_dump($this->params['orderExt']);die;
			$this->params = array_merge($this->params, ['redirect' => $redirect,'order_id' => $post->order_id]);
			return $this->render('../order.byhhgoodform.html', $this->params);	 	 
		}
		else
		{
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['order_id']);
			if(!$post->goods_id){
				return Message::popWarning("请输入商品ID!");
			}
			
 
			$orderOldGood =\common\models\OrderGoodsModel::find()->where(['order_id' => $post->order_id]);
			//var_dump($orderOldGood->createCommand()->getRawSql());die;
			$orderOldGood = $orderOldGood->one();
			
			//商品信息
			$goods = \common\models\GoodsModel::find()->alias('g')
			->select('g.*,gst.sales,gst.comments,gi.max_exchange')
			->joinWith('goodsStatistics gst', false)
			->joinWith('goodsIntegral gi', false)
			->with([
				'goodsImage'=>function($query){
					$query->orderBy('sort_order');
				}
			])
			->with('goodsSpec')
			->where(['g.goods_id' =>$post->goods_id]);
			//var_dump($goods->createCommand()->getRawSql());die;
			$goods = $goods->one();
			//var_dump($goods->goodsSpec[0]->spec_id);die;
			//var_dump($goods);die;
			//$goods =\common\models\GoodsModel::find()->where(['goods_id' => $post->goods_id]);
			//$goods = $goods->one();

			$orderGood =\common\models\OrderGoodsModel::find()->where(['order_id' => $orderOldGood->order_id,'goods_id' => $orderOldGood->goods_id]);
			//var_dump($orderGood->createCommand()->getRawSql());die;
			$orderGood = $orderGood->one();
			//var_dump($orderGood);die;
			
			//修改商品信息
			$orderGood->goods_id   	 = $goods->goods_id;
			$orderGood->goods_name   = $goods->goods_name;
			$orderGood->price = $goods->price;
			$orderGood->spec_id = $goods->goodsSpec[0]->spec_id;
			
			$orderGood->goods_image  = Page::urlFormat($goods->default_image, Yii::$app->params['default_goods_image']);
			//$orderGood->goods_image  = $goods->default_image ? $goods->default_image :'/data/system/default_goods_image.jpg';
			if(!$orderGood->save()) {
				return Message::popWarning($orderGood->errors);
			}
			//修改order价格
            $order = \common\models\OrderModel::find()->where(['order_id' => $post->order_id])->one();
			$order->goods_amount = $goods->price;
			if(!$order->save()) {
				return Message::popWarning($order->errors);
			}
			return Message::popSuccess("编辑成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}
	public function actionView()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['id']);
		if(!$post->id) {
			return Message::warning(Language::get('no_such_order'));
		}
		if(!($order = OrderModel::find()->alias('o')->select('o.*,oe.consignee,oe.region_name,oe.zipcode,oe.phone_tel,oe.phone_mob,oe.address,oe.shipping_name')
		->where(['o.order_id' => $post->id])
		->joinWith('orderExtm oe', false)
		->with('orderGoods')->asArray()->one())) {
			return Message::warning(Language::get('no_such_order'));
		}
		$this->params['order'] = $order;

		$this->params['page'] = Page::seo(['title' => Language::get('order_view')]);
		return $this->render('../order.view.byhh.html', $this->params);
	}
	
	/* 订单走势（图表）本月和上月的数据统计 */
	public function actionTrend()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true);
		
		list($curMonthAmount, $curMonthQuantity, $curDays, $beginMonth, $endMonth) = $this->getMonthTrend(Timezone::gmtime());
		list($preMonthAmount, $preMonthQuantity, $preDays) = $this->getMonthTrend($beginMonth - 1);
		
		$series = array($curMonthAmount, $preMonthAmount);
		$legend = array('本月销售额','上月销售额');
		if($post->type != 'amount')  {
			$series = array($curMonthQuantity, $preMonthQuantity);
			$legend = array('本月订单量','上月订单量');
		}
		
		$days = $curDays > $preDays ? $curDays : $preDays;
		
		// 获取日期列表
		$xaxis = array();
		for($day = 1; $day <= $days; $day++) {
			$xaxis[] = $day;
		}

		$this->params['echart'] = array(
			'id'		=>  mt_rand(),
			'theme' 	=> 'macarons',
			'width'		=> '100%',
			'height'    => 360,
			'option'  	=> json_encode([
				'grid' => ['left' => '20', 'right' => '20', 'top' => '80', 'bottom' => '20', 'containLabel' => true],
				'tooltip' 	=> ['trigger' => 'axis'],
				'legend'	=> [
					'data' => $legend
				],
				'calculable' => true,
   				'xAxis' => [
        			[
						'type' => 'category', 
						'data' => $xaxis
        			]
    			],
				'yAxis' => [
        			[
            			'type' => 'value'
        			]
   				 ],
				 'series' => [
					[
						'name' => $legend[0],
						'type' => 'line',
						'data' => $series[0],
						'smooth' => true
					],
					[
						'name' => $legend[1],
						'type' => 'line',
						'data' => $series[1],
						'smooth' => true
					]
				]
			])
		);
		
		$this->params['page'] = Page::seo(['title' => Language::get('order_trend')]);
		return $this->render('../echarts.html', $this->params);
	}
	
	/**
	 * 月数据统计 
	 * 拍下付款后即统计
	 */
	private function getMonthTrend($month = 0)
	{
		// 本月
		if(!$month) $month = Timezone::gmtime();
		
		// 获取当月的开始时间戳和结束那天的时间戳
		list($beginMonth, $endMonth) = Timezone::getMonthDay(Timezone::localDate('Y-m', $month));
		
		$list = DepositTradeModel::find()->select('amount,pay_time')->where(['bizIdentity' => Def::TRADE_ORDER])->andWhere(['>=', 'pay_time', $beginMonth])->andWhere(['<=', 'pay_time', $endMonth])->asArray()->all();
		
		// 该月有多少天
		$days = round(($endMonth-$beginMonth) / (24 * 3600));
		
		// 按天算归类
		$amount = $quantity = array();
		foreach($list as $key => $val)
		{
			$day = Timezone::localDate('d', $val['pay_time']);
	
			if(isset($amount[$day-1])) {
				$amount[$day-1] += $val['amount'];
				$quantity[$day-1]++;
			}
			else {
				$amount[$day-1] = $val['amount'];
				$quantity[$day-1] = 1;
			}
		}
		
		// 给天数补全
		for($day = 1; $day <= $days; $day++)
		{
			if(!isset($amount[$day-1])) {
				$amount[$day-1] = 0;
				$quantity[$day-1] = 0;
			}
		}
		// 按日期顺序排序
		ksort($amount);
		ksort($quantity);

		return array($amount, $quantity, $days, $beginMonth, $endMonth);
	}
	
	public function actionExport()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true);
		if($post->id) $post->id = explode(',', $post->id);
 
		$query = OrderModel::find()->alias('o')->select('o.order_id,o.order_sn,o.buyer_name,o.seller_name as store_name,o.goods_amount,
		o.order_amount,o.payment_name,o.status,o.add_time,o.pay_time,o.finished_time,
		oe.consignee,oe.signature,oe.address,oe.region_name,oe.shipping_fee,oe.send_date,obi.real_name,og.goods_name,og.goods_image');//oe.signature as real_name,'og.goods_name','og.goods_image'
		$query = $this->getConditions($post, $query)
		->joinWith('orderExtm oe', false)
		->joinWith('orderBuyerInfo obi', false)
		->joinWith('orderGoods og', false)
		->orderBy(['o.order_id' => SORT_DESC]);		
				
			
			
			
		if(!empty($post->id)) {
			$query->andWhere(['in', 'o.order_id', $post->id]);
		}
		else {
			$query = $this->getConditions($post, $query)->limit(100);
		}
		if($query->count() == 0) {
			return Message::warning(Language::get('no_data'));
		}
		$list = $query->asArray()->all();
		//var_dump($list);die;
		foreach ($list as $key => $value)
		{
			$list[$key]['tradeNo'] = DepositTradeModel::find()->select('tradeNo')->where(['bizOrderId' => $value['order_sn']])->scalar();// 是否申请过退款
			
			if(!empty($list[$key]['tradeNo']) && ($refund = RefundModel::find()->select('refund_id,status')->where(['tradeNo' => $list[$key]['tradeNo']])->one())) {
				$list[$key]['refund_status'] = $refund->status;
				$list[$key]['status'] = $refund->status == 'SUCCESS'? -2:0;
				$list[$key]['refund_id'] = $refund->refund_id;
			}else{
				$list[$key]['refund_status'] = '';
				$list[$key]['refund_id'] = '';
			}
		}
		//var_dump($list);die;
		return \frontend\models\OrderExportForm::download($list,$post->search_name);		
	}
	
	private function getSearchOption()
	{
		return array(
            'seller_name'	=> Language::get('store_name'),
           // 'buyer_name' 	=> Language::get('buyer_name'),
			'consignee' 	=> '收货人(收花人)',
			'signature' 	=> '签名落款(赠花人)',
			'real_name' 	=> '买货人(订花人)',
            'payment_name' 	=> Language::get('payment_name'),
            'order_sn' 		=> Language::get('order_sn'),
		);
	}
	
	private function getStatus($status = null)
	{
		$result = array(
            Def::ORDER_PENDING		=> Language::get('order_pending'),
           // Def::ORDER_SUBMITTED	=> Language::get('order_submitted'),
            Def::ORDER_ACCEPTED		=> Language::get('order_accepted'),
            Def::ORDER_SHIPPED		=> Language::get('order_shipped'),
            Def::ORDER_FINISHED		=> Language::get('order_finished'),
           // Def::ORDER_CANCELED		=> Language::get('order_canceled'),
            '999'	=> Language::get('order_canceled'),
        );

      // var_dump($result);die;
		if($status !== null) {
			return isset($result[$status]) ? $result[$status] : '';
		}
		return $result;
	}
	
	private function getConditions($post, $query = null)
	{	
		
		//var_dump($query->createCommand()->getRawSql());die;
		
		if($query === null) {
			foreach(array_keys(ArrayHelper::toArray($post)) as $field) {
				if(in_array($field, ['search_name', 'status', 'add_time_from', 'add_time_to', 'order_amount_from', 'order_amount_to'])) {
					return true;
				}
			}
			return false;
		}
		//var_dump($query);die;
		if($post->field && $post->search_name && in_array($post->field, array_keys($this->getSearchOption()))) {

			if($post->field == 'buyer_name'){
				$post->field = "o.buyer_name";//订货人登陆名
			}else if($post->field == 'real_name'){
				$post->field = "obi.real_name";//订货人实名
			}else if($post->field == 'signature'){
				$post->field ='oe.signature';//签名落款
			}else if($post->field == 'consignee'){
				$post->field ='oe.consignee';//收货人
			}else if($post->field == 'seller_name'){
				$post->field ='o.seller_name';//店铺名
			}
			//$query->andWhere([$post->field => $post->search_name]);
			$query->andWhere(['like',$post->field , $post->search_name]);

		}

		if($post->status) {
			
			$post->status = $post->status == 999 ? 0 : $post->status;
			$query->andWhere(['o.status' => $post->status]);
		}
		//var_dump($query->createCommand()->getRawSql());die;

		if($post->add_time_from) $post->add_time_from = Timezone::gmstr2time($post->add_time_from);
		if($post->add_time_to) $post->add_time_to = Timezone::gmstr2time_end($post->add_time_to);
		if($post->add_time_from && $post->add_time_to) {
			$query->andWhere(['and', ['>=', 'o.add_time', $post->add_time_from], ['<=', 'o.add_time', $post->add_time_to]]);
		}
		if($post->add_time_from && (!$post->add_time_to || ($post->add_time_to <= $post->add_time_from))) {
			$query->andWhere(['>=', 'o.add_time', $post->add_time_from]);
		}
		if(!$post->add_time_from && ($post->add_time_to && ($post->add_time_to > Timezone::gmtime()))) {
			$query->andWhere(['<=', 'o.add_time', $post->add_time_to]);
		}
		
		if($post->order_amount_from) $post->order_amount_from = floatval($post->order_amount_from);
		if($post->order_amount_to) $post->order_amount_to = floatval($post->order_amount_to);
		if($post->order_amount_from && $post->order_amount_to) {
			$query->andWhere(['and', ['>=', 'o.order_amount', $post->order_amount_from], ['<=', 'o.order_amount', $post->order_amount_to]]);
		}
		if($post->order_amount_from && (!$post->order_amount_to || ($post->order_amount_to < 0))) {
			$query->andWhere(['>=', 'o.order_amount', $post->order_amount_from]);
		}
		if(!$post->order_amount_from && ($post->order_amount_to > 0)) {
			$query->andWhere(['<=', 'o.order_amount', $post->order_amount_to]);
		}
		
		return $query;
	}
}
