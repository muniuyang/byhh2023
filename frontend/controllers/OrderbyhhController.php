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
				'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js,jquery.plugins/jquery.validate.js,dialog/dialog.js,mlselection.js,user.js,jquery.plugins/jquery.form.js',
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
			return $this->render('../order.byhhindex.html', $this->params);
		}
		else
		{
			$query = OrderModel::find()->alias('o')->select('o.order_id,o.order_sn,o.buyer_name,o.seller_name as store_name,o.goods_amount,o.order_amount,o.payment_name,o.status,o.add_time,o.pay_time,o.finished_time,
			oe.consignee,oe.signature,oe.address,oe.shipping_fee,obi.real_name,og.goods_name,og.goods_image');
			$query = $this->getConditions($post, $query)
			->joinWith('orderExtm oe', false)
			->joinWith('orderBuyerInfo obi', false)
			->joinWith('orderGoods og', false)
			->orderBy(['o.order_id' => SORT_DESC]);
			
			//var_dump($query->createCommand()->getRawSql());die;
			$page = Page::getPage($query->count(), $post->limit ? $post->limit : 20);
			$list = $query->offset($page->offset)->limit($page->limit)->asArray()->all();
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
	public function actionCuser()
	{
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['action'] = Url::toRoute(['orderbyhh/extro', 'order_id' => $post->order_id]);
			$redirect = Url::toRoute(['orderbyhh/index']);
			$this->params = array_merge($this->params, ['extro_info' => $extroInfo['orderExtm'], 'redirect' => $redirect]);
			return $this->render('../order.byhhuserform.html', $this->params);
		}else{
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			if(in_array($post->utype,[1,2])){
				return Message::popWarning("用户的类型未选择!");
			}
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
				$umodel = new \frontend\models\UserRegisterForm();
				$username = $post->username ;
				$umodel->username  = $username;
				$umodel->phone_mob = '';
				$umodel->password  =  $post->password;
				$umodel->confirmPassword = $post->password;
				$umodel->agree =1;
				if ($user = $umodel->register(['real_name'=>$username])) {
					$ubmodel = new \common\models\UserBillModel();
					$ubmodel->userid = $user->userid;
					if(!$ubmodel->save()) {
						return Message::popWarning($ubmodel->errors);
					}
				}else{
					return Message::popWarning($umodel->errors);
				}
			}else{
				return Message::popWarning("权限不够");
			}
			return Message::popSuccess("添加成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('orderbyhh/index'))));
		}
	}
	
	
	
	public function actionView()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['id']);
		if(!$post->id) {
			return Message::warning(Language::get('no_such_order'));
		}
		if(!($order = OrderModel::find()->alias('o')->select('o.*,oe.consignee,oe.region_name,oe.zipcode,oe.phone_tel,oe.phone_mob,oe.address,oe.shipping_name')->where(['o.order_id' => $post->id])->joinWith('orderExtm oe', false)->with('orderGoods')->asArray()->one())) {
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
		oe.consignee,oe.signature,oe.address,oe.region_name,oe.shipping_fee,obi.real_name,og.goods_name,og.goods_image');//oe.signature as real_name,'og.goods_name','og.goods_image'
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
		return \frontend\models\OrderExportForm::download($list);		
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
            Def::ORDER_SUBMITTED	=> Language::get('order_submitted'),
            Def::ORDER_ACCEPTED		=> Language::get('order_accepted'),
            Def::ORDER_SHIPPED		=> Language::get('order_shipped'),
            Def::ORDER_FINISHED		=> Language::get('order_finished'),
            Def::ORDER_CANCELED		=> Language::get('order_canceled'),
        );
		if($status !== null) {
			return isset($result[$status]) ? $result[$status] : '';
		}
		return $result;
	}
	
	private function getConditions($post, $query = null)
	{
	
		if($post->field == 'real_name'){
			/*
			$Pinyin =  new Pinyin();
			$pinyinArr = $Pinyin->convert($post->search_name);
			foreach ($pinyinArr as $pinyin) {
				$loginStr .= substr($pinyin, 0, 1);
			}
			$username  = $loginStr.'2023';	
			*/
			$username = $post->search_name;
			$post->field = 'buyer_name';
			$post->search_name = $username;
			//var_dump($username);die;
		}
		
		
		//var_dump($query->createCommand()->getRawSql());die;
		
		if($query === null) {
			foreach(array_keys(ArrayHelper::toArray($post)) as $field) {
				
				if(in_array($field, ['search_name', 'status', 'add_time_from', 'add_time_to', 'order_amount_from', 'order_amount_to'])) {
					return true;
				}
			}
			return false;
		}
		//var_dump($post);die;
		if($post->field && $post->search_name && in_array($post->field, array_keys($this->getSearchOption()))) {
			$query->andWhere([$post->field => $post->search_name]);
		}
		if($post->status) {
			$query->andWhere(['status' => $post->status]);
		}
		if($post->add_time_from) $post->add_time_from = Timezone::gmstr2time($post->add_time_from);
		if($post->add_time_to) $post->add_time_to = Timezone::gmstr2time_end($post->add_time_to);
		if($post->add_time_from && $post->add_time_to) {
			$query->andWhere(['and', ['>=', 'add_time', $post->add_time_from], ['<=', 'add_time', $post->add_time_to]]);
		}
		if($post->add_time_from && (!$post->add_time_to || ($post->add_time_to <= $post->add_time_from))) {
			$query->andWhere(['>=', 'add_time', $post->add_time_from]);
		}
		if(!$post->add_time_from && ($post->add_time_to && ($post->add_time_to > Timezone::gmtime()))) {
			$query->andWhere(['<=', 'add_time', $post->add_time_to]);
		}
		
		if($post->order_amount_from) $post->order_amount_from = floatval($post->order_amount_from);
		if($post->order_amount_to) $post->order_amount_to = floatval($post->order_amount_to);
		if($post->order_amount_from && $post->order_amount_to) {
			$query->andWhere(['and', ['>=', 'order_amount', $post->order_amount_from], ['<=', 'order_amount', $post->order_amount_to]]);
		}
		if($post->order_amount_from && (!$post->order_amount_to || ($post->order_amount_to < 0))) {
			$query->andWhere(['>=', 'order_amount', $post->order_amount_from]);
		}
		if(!$post->order_amount_from && ($post->order_amount_to > 0)) {
			$query->andWhere(['<=', 'order_amount', $post->order_amount_to]);
		}
		
		return $query;
	}
}
