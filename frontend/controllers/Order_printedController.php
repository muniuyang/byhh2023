<?php

/**
 * jcheng add
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace frontend\controllers;

use Yii;
use PHPExcel;
//use PHPWord;
use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\Settings;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\helpers\Json;
use common\library\Resource;
use common\models\NavigationModel;
use common\models\OrderPrintContentModel;

use common\library\Language;
use common\library\Timezone;
use common\library\Basewind;
use common\library\Message;
use common\library\Page;
use common\library\Taskqueue;
use PhpOffice\PhpWord\Shared\Converter;
/**
 * @Id Near_orderController.php 2018.5.16 $
 * @author mosir
 */

class Order_printedController extends \common\controllers\BaseUserController
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
		$get = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id','ptf','cate_id']);
		
		//$this->params = ArrayHelper::merge($this->params, Page::getAssign('user'));
		$this->params = ArrayHelper::merge($this->params, Page::getAssign('user'), [
			'navs'	=>['middle'=>
					[
						['nav_id'=>'v01','title'=>'花束卡片','link'=>'order_printed/lists.html?cate_id=21&order_id='.$get->order_id],
						['nav_id'=>'v012','title'=>'绿植卡片','link'=>'order_printed/lists.html?cate_id=22&order_id='.$get->order_id],
						['nav_id'=>'v013','title'=>'内容','link'=>'order_printed/contents.html?cate_id=23&order_id='.$get->order_id],
						['nav_id'=>'v014','title'=>'地址','link'=>'order_printed/addresss.html?cate_id=24&order_id='.$get->order_id],
					]
			] 
		]);
		Taskqueue::run();
	}

	public function actionView()
    {
		
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id','ptf']);
		
		$model = new \frontend\models\Buyer_orderViewForm();
		//$model = new \frontend\models\Seller_orderViewForm(['store_id' => $this->visitor['store_id']]);
		if(!($orderInfo = $model->formData($post))) {
			return Message::warning($model->errors);
		}
		$orderInfo['ptf'] = $post->ptf;
		//VAR_DUMP($orderInfo['orderExtm']);die;
		$orderInfo['postscript'] = $orderInfo['orderExtm']['signature'];
		$orderInfo['content']    = $orderInfo['orderExtm']['content'];
		
		if($post->ptf >=1 && $post->ptf<=100){
			$this->actionExcute($orderInfo);
		}else if($post->ptf >=101 && $post->ptf<=201){
			$orderInfo['is_meeting'] = $orderInfo['orderExtm']['is_meeting'];
			$this->actionPrinted($orderInfo);
		}else{
			$this->actionPrintedt($orderInfo);
			return Message::warning("没找到模版，模版不存在！");
		} 
	  
	}
	/**
	 *  打印模版列表
	 */
	public function actionLists()
    {
		
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id','ptf','cate_id']);
		//var_dump($post);
		if(in_array($post->cate_id, [23,24])){
			return $this->render('../printed.content.html', $this->params);
		}
		if($post->cate_id == '22'){
			$tempType = 2;
		}else{
			$post->cate_id = 21;
			$tempType = 1;
		}
		
		$tempList = \common\models\OrderPrintTempModel::find()->select('temp_sort,temp_w,temp_h,temp_t')
		->where(['and',['=', 'temp_t', $tempType],['=', 'status', 1]])->orderBy(['temp_sort' => SORT_DESC])->asArray()->all();
		
		//var_dump($tempList);die;
		$this->params['cate_id'] = $post->cate_id;
		$this->params['order_id'] = $post->order_id;
		$this->params['tempList']=$tempList;
		$this->params['_foot_tags'] = Resource::import([
			'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js, dialog/dialog.js',
            'style' =>  'jquery.ui/themes/smoothness/jquery.ui.css,dialog/dialog.css'
		]);
		return $this->render('../printed.list.html', $this->params);
	}
	/**
	 *  打印卡片内容列表
	 */
	public function actionContents()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id','ptf','cate_id','cate_name']);
		//$this->params['nameS'] = explode(' ',$post->cate_name);
		//var_dump(Yii::$app->request->get());
		//var_dump($this->params['cate_name']);
		
		$this->params['SeleOne'] = $this->selectItems($v['pid'],$v['cid'],'one');
		$this->params['_foot_tags'] = Resource::import([
			'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js, dialog/dialog.js',
	        'style' =>  'jquery.ui/themes/smoothness/jquery.ui.css,dialog/dialog.css'
		]);
		return $this->render('../printed.content.html', $this->params);
	}
	public function actionClist(){
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['limit', 'page', 'status','s1','s2']);
		if(!Yii::$app->request->isAjax) 
		{
			
			$temps = [''];
			$this->params['userBill'] = $temps;
			return $this->render('../order.byhhindex.html', $this->params);
		}
		else
		{
			$query = OrderPrintContentModel::find()->select(['id','pid','cid','content','status']);
			if($post->s1 && $post->s2){
				$query = $query->where(['and',['=', 'pid', $post->s1],['=', 'cid', $post->s2]]);
			}elseif($post->s1){
				$query = $query->where(['pid'=> $post->s1]);
			}elseif($post->s2){
				$query = $query->where(['pid'=> $post->s2]);
			}
			$query = $query->orderBy(['id' => SORT_DESC]);
			$count = $query->count();
			//var_dump($query->createCommand()->getRawSql());die;
			$page = Page::getPage($count, $post->limit ? $post->limit : 10);
			$list = $query->offset($page->offset)->limit($page->limit)->asArray()->all();
			foreach($list as $k=>$v){
				$SeleTwo = $this->selectItems($v['pid'],$v['cid']);
				$list[$k]['icons'] = $SeleTwo;
			}
			return Json::encode(['code' => 0, 'msg' => '', 'count' =>$count , 'data' => $list]);
		}
	}	
	/**
	 *  打印卡片地址列表
	 */
	public function actionAddresss()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['limit', 'page', 'status']);
		if(!Yii::$app->request->isAjax) 
		{
			$this->params['_foot_tags'] = Resource::import([
				'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js,jquery.plugins/jquery.validate.js,dialog/dialog.js,mlselection.js,user.js
				,jquery.plugins/jquery.form.js,inline_edit.js,jquery.plugins/timepicker/jquery-ui-timepicker-addon.js',
				'style' =>  'jquery.ui/themes/smoothness/jquery.ui.css,dialog/dialog.css,jquery.plugins/timepicker/jquery-ui-timepicker-addon.css'
			]);
			$this->params['filtered'] = $this->getConditions($post);
			$this->params['defaultMarkets']   = ['周边','云尚','蓝宝石','红宝石','金座','银座','老三镇','金正茂','金昌','翡翠座','小商品','中心商城','品牌','大夹街'];
			$this->params['defaultisDefects'] = ['不完整地址','完整地址'];
			return $this->render('../printed.address.html', $this->params);
		}
		else
		{

			//$sql = 'SELECT id from(SELECT * FROM swd_address_customer order by up_time desc) customers group by consignee ORDER BY up_time DESC;';
			//$query =  Yii::$app->db->createCommand($sql, [':id' => 1]);//->queryAll();
			//var_dump($query->getRawSql());die;
			$query =\common\models\AddressCustomerModel::find()->alias('o')->select('o.*');
			if($post->search_name){
				$query = $query->andWhere(['like','o.consignee' , $post->search_name]);
			}
			if($post->region_no!='' && $post->region_no>=0){
				$query = $query->andWhere(['=','o.region_no' , $post->region_no]);
			}
			if(isset($post->isDefect) && $post->isDefect!='' && in_array($post->isDefect,[0,1])){
				$query = $query->andWhere(['=','o.is_defect' , $post->isDefect]);
			}
			//$query = $query->groupBy('o.consignee');
			$query = $query->orderBy(['o.up_time' => SORT_DESC,'o.id' => SORT_DESC]);
			//var_dump($post,$query->createCommand()->getRawSql());die;
			$page = Page::getPage($query->count(), $post->limit ? $post->limit : 15);
			$list = $query->offset($page->offset)->limit($page->limit)->asArray()->all();
			foreach ($list as $key => $value)
			{
				$list[$key]['up_time'] = Timezone::localDate('Y-m-d H:i:s', $value['up_time']);
			}
			return Json::encode(['code' => 0, 'msg' => '', 'count' => $query->count(), 'data' => $list]);
		}
	
	}
	public function actionAlist(){
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['limit', 'page', 'status','s1','s2']);
		if(!Yii::$app->request->isAjax) 
		{
			
			$temps = [''];
			$this->params['userBill'] = $temps;
			return $this->render('../order.byhhindex.html', $this->params);
		}
		else
		{
 
			$query = \common\models\AddressCustomerModel::find()->select('*');
			$query = $query->orderBy(['id' => SORT_DESC]);
			$count = $query->count();
			//var_dump($query->createCommand()->getRawSql());die;
			$page = Page::getPage($count, $post->limit ? $post->limit : 50);
			$list = $query->offset($page->offset)->limit($page->limit)->asArray()->all();
			 
			return Json::encode(['code' => 0, 'msg' => '', 'count' =>$count , 'data' => $list]);
		}
	}
	/**
	 * 创建更新客户地址
	 */
	public function actionCaddress()
	{
		if(!Yii::$app->request->isPost)
		{
			$post = Basewind::trimAll(Yii::$app->request->get(), true);
			$this->params['action'] = Url::toRoute(['order_printed/caddress', 'from' => 'address']);
			$redirect = Url::toRoute(['order_printed/addresss']);
			$this->params['regions'] = \common\models\RegionModel::find()->select('region_name')
			->where(['parent_id' => 0, 'if_show' => 1])->indexBy('region_id')->column();
			$this->params['address'] = ['defaddr'=>1,'region_id'=>'284','region_name'=>'湖北省 武汉'];
			$orderInfo = \common\models\AddressCustomerModel::find()->alias('o')
			->select('o.*')
			->where(['o.id' => $post->id])->asArray()->one();
			//var_dump($orderInfo);die;
			$this->params = array_merge($this->params, ['redirect' => $redirect]);
			$this->params = array_merge($this->params, ['address_info' => $orderInfo, 'redirect' => $redirect]);
			return $this->render('../order_printed.addressform.html', $this->params);
		}else{
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			if(!$post->consignee){
				return Message::popWarning("请输入收货人!");
			}
			if(!$post->address){
				return Message::popWarning("请输入详细地址!");
			}
			if($res = preg_match_all("/云尚|蓝宝石|红宝石|金座|银座|老三镇|金正茂|金昌|翡翠座|小商品|中心商城|品牌|大夹街/",$post->address,$matches)){
				$regions = ['周边','云尚','蓝宝石','红宝石','金座','银座','老三镇','金正茂','金昌','翡翠座','小商品','中心商城','品牌','大夹街'];
				$region_no = array_search($matches[0][0], $regions);//找数组里指定值的键
				//var_dump($res,$region_no,$matches);
			}else{
				$region_no = 0;
			}
			if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
			
				$customerModel = \common\models\AddressCustomerModel::find()->alias('o');
				if($post->id){ //更新
					$customerModel = $customerModel->where(['o.id' => $post->id]);
				}else{//插入
					$customerModel = $customerModel->where(['o.consignee' => $post->consignee]);
					$customerModel = $customerModel->andWhere(['like','o.add_date' , @date('Y')]);
				}
				//var_dump($customerModel->createCommand()->getRawSql());die('33');
				$customerModel = $customerModel->one();
				if(!$customerModel){
					$customerModel = new \common\models\AddressCustomerModel();
				}
				$customerModel->consignee = $post->consignee;
				$customerModel->region_id = $post->region_id;
				$customerModel->region_name = $post->region_name;
				$customerModel->address = $post->address;
				$customerModel->zipcode = $post->zipcode;
				$customerModel->phone_mob = $post->phone_mob;
				$customerModel->region_no = $region_no;
				$customerModel->add_date = @date('Y-m-d',time());
				$customerModel->up_time = time();//-8*3600;
				if(!$customerModel->save()){
					return Message::popWarning($customerModel->errors);
				}
			}else{
				return Message::popWarning("权限不够");
			}
			return Message::popSuccess("添加成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('order_printed/addresss'))));
		}
	}
	
	
	/**
	 * 修改订单价格
	 */
	public function actionEditcol()
	{
		$get = Basewind::trimAll(Yii::$app->request->get(), true);
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['id', 'is_defect','is_inline']);
		if(in_array($post->column, ['is_defect','is_inline'])) 
		{
		  	$customerModel = \common\models\AddressCustomerModel::find()->where(['id'=>$post->id])->one();
			
		  	$customerModel->{$post->column} = $post->value;
		  	if(!($status = $customerModel->save())) {
		  		return Message::warning($customerModel->errors);
		  	}
		  	return Message::display(Language::get('edit_ok'));
		}else{
			 
		}
	}
	
	/**
	 *  添加卡片内容
	 */
	public function actionCreats()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['id','pid','cid','content']);
		if(!Yii::$app->request->isPost){
			$model = new \frontend\models\OrderPrintContentForm();
			$oInfo = $model->formData($post);
			//var_dump($oInfo);
			if($oInfo) {
				//var_dump($oInfo);
				$this->params['selec'] = $this->selectItems($oInfo['pid'],$oInfo['cid']);
				//return Message::warning($model->errors);
			}
			//var_dump($this->params['selec']);
			$redirect = Url::toRoute(['order_printed/contents', 'id' => $post->id]);
			$this->params['SeleOne'] = $this->selectItems($v['pid'],$v['cid'],'one');
			
			$this->params['oInfo']   = $oInfo;
			$this->params = array_merge($this->params, ['extro_info' => $oInfo, 'redirect' => $redirect]);
			return $this->render('../printed.content.creat.html', $this->params);
		}else{
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			//var_dump($post);
			if($post->id){
				//$cModel = OrderPrintContentModel::find()->where(['id'=> $post->id])->one();
				$cModel = new \frontend\models\OrderPrintContentForm();
				if(!$post->pid && $post->opid){
					$post->pid = $post->opid;
				}
				if(!$post->cid && $post->ocid){
					$post->cid = $post->ocid;
				}
				//$cModel->pid 	= $post->pid;
				//$cModel->cid 	= $post->cid;
				//$cModel->content = $post->content;
				//$cModel->p_sort  = 0;
				//$cModel->status  = 1;
				if(!$cModel->save($post,true)){
					return Message::popWarning($cModel->errors);
				}
			}else{
				//$sql = $cModel->createCommand()->getRawSql();
				$cModel = new \frontend\models\OrderPrintContentForm();
				if(!$cModel->save($post,true)){
					return Message::popWarning($cModel->errors);
				}
			}
			//die;
			return Message::popSuccess("操作成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('order_printed/contents'))));
		}
	}
	/**
	 *  添加卡片内容
	 */
	public function actionEdits()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['id','pid','cid','content']);
		if(!Yii::$app->request->isPost){
			// 获取订单模型
			$model = new \frontend\models\OrderPrintContentForm();
			if(!($oInfo = $model->formData($post))) {
				return Message::warning($model->errors);
			}
			$this->params['action'] = Url::toRoute(['order_printed/edits', 'id' => $post->id, 'from' => 'class']);
			$redirect = Url::toRoute(['order_printed/contents', 'id' => $post->id]);
			$this->params['status'] =[
					'1'=>'上线',
					'0'=>'下线'
			];
			$this->params['oInfo']   = $oInfo;
	 
			$this->params = array_merge($this->params, ['redirect' => $redirect]);
			
			return $this->render('../printed.content.edit.html', $this->params);
		}else{
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			$cModel = OrderPrintContentModel::find()->where(['id'=> $post->id])->one();
			
			//var_dump($post->status);die;
			$cModel->status  = $post->status;
			if(!$cModel->save()){
				return Message::popWarning($cModel->errors);
			}
			return Message::popSuccess("操作成功", urldecode(Yii::$app->request->post('redirect', Url::toRoute('order_printed/contents'))));
		}
	}
	public function actionMlselection()
	{
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['store_id','pid']);
		if(!in_array($post->type, array('region', 'gcategory'))) {
			return Message::warning(Language::get('invalid type'));
		}
		if( $post->type >6 ) {
			return Message::result();
		}
		$SeleTwo = $this->selectItems($post->pid);
		if(!is_null($SeleTwo)){
			//var_dump($SeleTwo);die;
			$this->params['SeleTwo'] = array_values($SeleTwo); 
		}else{
			$this->params['SeleTwo'] = $SeleTwo;
		}
		//var_dump(array_map('array_values',$SeleTwo));
		//var_dump(array_values($SeleTwo));
		//$this->params['SeleTwo'] = $SeleTwo; 
		return Message::result($this->params['SeleTwo']);
	}
	
	public function selectItems($pid, $cid=0, $type='no'){
		$SeleOne = [1=>'生日',2=>'节日',3=>'纪念日',4=>'其他特殊日子',5=>'开业'];
		
		$SeleTwo = [
			1=>[
				11=>['mls_id'=>'11','mls_name'=>'送儿女生日'],
				12=>['mls_id'=>'12','mls_name'=>'送老婆生日'],
				13=>['mls_id'=>'13','mls_name'=>'送母亲生日'],
				14=>['mls_id'=>'14','mls_name'=>'送父亲生日'],
				15=>['mls_id'=>'15','mls_name'=>'送闺蜜生日'],
				16=>['mls_id'=>'16','mls_name'=>'送朋友生日']
			],
			2=>[
				21=>['mls_id'=>'21','mls_name'=>'七夕'],
				22=>['mls_id'=>'22','mls_name'=>'情人节'],
				23=>['mls_id'=>'23','mls_name'=>'妇女节'],
				24=>['mls_id'=>'24','mls_name'=>'母亲节日'],
				25=>['mls_id'=>'25','mls_name'=>'父亲节日'],
				26=>['mls_id'=>'26','mls_name'=>'520节日']
			],
			3=>[
				31=>['mls_id'=>'31','mls_name'=>'结婚纪念日'],
				32=>['mls_id'=>'32','mls_name'=>'相识纪念日'],
			],
			4=>[
				41=>['mls_id'=>'41','mls_name'=>'高考'],
				42=>['mls_id'=>'42','mls_name'=>'老人'],
			],
			5=>[
				51=>['mls_id'=>'51','mls_name'=>'订货会'],
				52=>['mls_id'=>'52','mls_name'=>'开业'],
			],
		];
		if( $type == 'no'){
			$result = $SeleTwo[$pid];
			if($pid && $cid){
				$result = $result[$cid];
				$result['p_name'] = $SeleOne[$pid];
			}		
		}else if($type == 'one'){
			$result = $SeleOne;
		}
		return $result;
	}
	
	
	
	public function actionIview(){
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id','ptf']);
		$this->params['dialog_id'] = $post->dialog_id;
		if(stripos("find-".$post->dialog_id,'a')){
			$this->params['dialog_show'] = 'a-action';
			//$ns = str_split($this->params['dialog_id']);
			preg_match('/\d+/',$this->params['dialog_id'],$matchs);
			//var_dump($matchs);die;
			$this->params['cardsA'] =[['id'=>'a'.$matchs[0].'-1'],['id'=>'a'.$matchs[0].'-2'],['id'=>'a'.$matchs[0].'-3']];
		}else if(stripos("find-".$post->dialog_id,'b')){
			$this->params['dialog_show'] = 'b-action';
			if($post->dialog_id == 'b110'){
			preg_match('/\d+/',$this->params['dialog_id'],$matchs);
			 $this->params['cardsB'] =[['id'=>'b'.$matchs[0].'-1'],['id'=>'b'.$matchs[0].'-2'],['id'=>'b'.$matchs[0].'-3']];	
			}

		}else{
			return Message::warning("没找到模版，模版不存在！");
		}

		return $this->render('../printed.dailog.html', $this->params);
	}
	
	
	
	/**
	* 小卡片打印
	*/
	public function actionExcute($order){

		$logo = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png';
		$templateFile = dirname(Yii::$app->BasePath).'/frontend/web/data/template/printed_card_a'.$order['ptf'].'.docx';
		
		
		$orderExt = $order['orderExtm'];
		$filename = 'F'.$order['ptf'].'['.$order['order_id'].']['.$order['postscript'].']送['.$orderExt['consignee'].'].docx';
		$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/'.$filename;
		// 创建新文档
		$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($templateFile);
		$templateProcessor->setValue('title', $orderExt['consignee']);// On footer
		$templateProcessor->setValue('signer',$order['postscript']); 
		if(!$order['content']){
			$order['content'] = "烛光闪闪，快乐幸福，生日快乐，心想事成，幸运之日，吉祥之日，愿愿顺心，事事如意，祝君生日快乐，开心幸福！";
		}
		$templateProcessor->setValue('content',$order['content']); 
		$templateProcessor->saveAs($resultFile);
		/**
		 * 改变打印状态
		 */
		if($order['order_id']){
			$orderExt = \common\models\OrderExtmModel::find()->where(['order_id'=>$order['order_id']])->one();
			$orderExt->	is_printed = 1;
			$orderExt->save();
		}
		$this->actionDown($resultFile);
	}
    //http://shopwind.byhh.com/order_printed/printedf1.html
	/**
	 * 开业打印
	 */
	public function actionPrintedt($order)
	{
		$templateFile = dirname(Yii::$app->BasePath).'/frontend/web/data/template/create/'.$order['ptf'].'.docx';
		//var_dump($templateFile);die;
		$orderExt = $order['orderExtm'];
		$specialChars = array("$", "#", "@", "!", "^", "&", "*"," ");
		$orderExt['consignee'] = str_replace($specialChars, '', $orderExt['consignee']);
		$orderExt['address'] = str_replace($specialChars, '', $orderExt['address']);
		//$orderExt['consignee'] = preg_replace('/[^a-zA-Z0-9\s]/', '', $orderExt['consignee']);
		$tempResFile = dirname(Yii::$app->BasePath).'/frontend/web/data/template/create/tempFile.docx';
		
		
		
		
		//重新加载加入图片
		$phpWord = new PhpWord();
		//$phpWord = \PhpOffice\PhpWord\IOFactory::load($templateFile);
		//$sections = $phpWord->getSections();
		//$section  = $sections[0];
		// 设置一个新的节，并添加文本流
		$section = $phpWord->addSection([
			'paperSize' => 'A4', 
			'marginLeft' => 0, 
			'marginRight' => 0, 
			'marginTop' => 0, 
			'marginBottom' => 0,
			'orientation' => \PhpOffice\PhpWord\Style\Section::ORIENTATION_LANDSCAPE // 设置页面大小为横向
			
			]
		);

		//Absolute positioning
		//$section->addText('Absolute positioning: see top right corner of page');
		// 设置左右边距，单位为磅
 
		$a4 = dirname(Yii::$app->BasePath).'/frontend/web/data/template/a4-1.png';
		// 加载背景图片
		$backgroundImage = imagecreatefrompng($a4);
		// 加载二维码图片
		$qrCodePath =  dirname(Yii::$app->BasePath).'/frontend/web/data/template/byQrcodeM400.png';
		$qrCodeImage = imagecreatefrompng($qrCodePath);
		// 获取图片尺寸
		$backgroundWidth = imagesx($backgroundImage);
		$backgroundHeight = imagesy($backgroundImage);
		$qrCodeWidth = imagesx($qrCodeImage);
		$qrCodeHeight = imagesy($qrCodeImage);
		// 合并图片
		// 假设你想把二维码放在右下角，调整这里的坐标
		$x = $backgroundWidth - $qrCodeWidth-120;
		$y = ($backgroundHeight - $qrCodeHeight)/2-680;
		imagecopy($backgroundImage, $qrCodeImage, $x, $y, 0, 0, $qrCodeWidth, $qrCodeHeight);
		$imagePath = dirname(Yii::$app->BasePath).'/frontend/web/data/template/img/QrCode/createQrCode-'.$order['order_id'].'.png';
		imagejpeg($backgroundImage,$imagePath);
		
		
		
		$section->addImage(
		   $imagePath,
			[
			'width' => '840',
			'height' =>  '595',
				'wrap' => \PhpOffice\PhpWord\Style\Image::WRAPPING_STYLE_SQUARE,
				 
			]
		);
/*
		 $section->addImage(
			$a4,
			 [
				'width' => '840',
				'height' =>  '595',
				 'positioning' => \PhpOffice\PhpWord\Style\Image::POSITION_ABSOLUTE,
				 'posHorizontal' => \PhpOffice\PhpWord\Style\Image::POSITION_HORIZONTAL_RIGHT,
				 'posHorizontalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
				 'posVerticalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
				 'marginLeft' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(15.5),
				 'marginTop' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(1.55),
			 ]
		 );
  */
 
		$objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
		$objWriter->save($tempResFile);
			
		
		
		
		
		
		
		
		
		
		
		$filename = 'F'.$order['ptf'].'['.$order['order_id'].']送['.$orderExt['consignee'].'].docx';
		$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/template/create/'.$filename;
		
		
		// 创建新文档
		$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($tempResFile);
		$templateProcessor->setValue('address',$orderExt['address']);// On section/content

 
		//content
		$templateProcessor->setValue('title', $orderExt['consignee']);// On footer
		if($order['is_meeting'] == 1 && !$order['content']){
			$order['content'] = "订货会圆满成功";
		}
		if(!$order['content']){
			$order['content'] = "开业大吉,生意兴隆";
		}
		$templateProcessor->setValue('content',$order['content']); 

		if(in_array($order['ptf'],[23,24,25,26,27,28])){
			$sigers = explode(',',$order['postscript']);
			$ct = count($sigers);
			foreach($sigers as $k=>$v){
				$templateProcessor->setValue('signer'.$k,$v); 
			}
			if($order['ptf'] == 23){$j=3;$st=$j-$ct;}
			if($order['ptf'] == 24){$j=4;$st=$j-$ct;}
			if($order['ptf'] == 25){$j=6;$st=$j-$ct;}
			if($st>0){
 				for($i=$ct;$i<$j;$i++){
 					$templateProcessor->setValue('signer'.$i,''); 
 				}
 			}
		}else{
			$templateProcessor->setValue('signer',$order['postscript']); // On header
		}
		
		/*
		// 加载背景图片
		$backgroundPath = dirname(Yii::$app->BasePath).'/frontend/web/data/template/byQrcodeB200.png';
		$backgroundImage = imagecreatefrompng($backgroundPath);
		// 加载二维码图片
		$qrCodePath =  dirname(Yii::$app->BasePath).'/frontend/web/data/template/byQrcodeM200.png';
		$qrCodeImage = imagecreatefrompng($qrCodePath);
		// 获取图片尺寸
		$backgroundWidth = imagesx($backgroundImage);
		$backgroundHeight = imagesy($backgroundImage);
		$qrCodeWidth = imagesx($qrCodeImage);
		$qrCodeHeight = imagesy($qrCodeImage);
		// 合并图片
		// 假设你想把二维码放在右下角，调整这里的坐标
		$x = ($backgroundWidth - $qrCodeWidth)/2 - 10;
		$y = ($backgroundHeight - $qrCodeHeight)/2+25;
		imagecopy($backgroundImage, $qrCodeImage, $x, $y, 0, 0, $qrCodeWidth, $qrCodeHeight);
		$imagePath = dirname(Yii::$app->BasePath).'/frontend/web/data/template/img/QrCode/createQrCode-'.$order['order_id'].'.png';
		imagejpeg($backgroundImage,$imagePath);
		// 替换图片占位符
		$templateProcessor->setImageValue('qrCode', [
			'path' => $imagePath,
			'width' => 180,
			'height' => 210,
			//'alignment' => \PhpOffice\PhpWord\SimpleType\JcTable::CENTER,
			'ratio' => false
		]);
       //*/
	   
	   $templateProcessor->saveAs($resultFile);
		/**
		 * 改变打印状态
		 */
		//var_dump($order['order_id']);
		if($order['order_id']){
			$orderExt = \common\models\OrderExtmModel::find()->where(['order_id'=>$order['order_id']])->one();
			$orderExt->	is_printed = 1;
			$orderExt->save();
		}
		
		

		//下载文件
		$this->actionDown($resultFile);
	} 
	public function actionPrinted($order){
		$logo = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png';
		$templateFile = dirname(Yii::$app->BasePath).'/frontend/web/data/template/printed_card_b'.$order['ptf'].'.docx';
		$orderExt = $order['orderExtm'];
		$specialChars = array("$", "#", "@", "!", "^", "&", "*"," ");
		$orderExt['consignee'] = str_replace($specialChars, '', $orderExt['consignee']);
		$orderExt['address'] = str_replace($specialChars, '', $orderExt['address']);
		//$orderExt['consignee'] = preg_replace('/[^a-zA-Z0-9\s]/', '', $orderExt['consignee']);
		$filename = 'F'.$order['ptf'].'['.$order['order_id'].']送['.$orderExt['consignee'].'].docx';
		$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/'.$filename;
		
		// 创建新文档
		$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($templateFile);
		$templateProcessor->setValue('address',$orderExt['address']);// On section/content
	
	 
		//content
		$templateProcessor->setValue('title', $orderExt['consignee']);// On footer
		if($order['is_meeting'] == 1 && !$order['content']){
			$order['content'] = "订货会圆满成功";
		}
		if(!$order['content']){
			$order['content'] = "开业大吉,生意兴隆";
		}
		$templateProcessor->setValue('content',$order['content']); 
	
		if(in_array($order['ptf'],[23,24,25,26,27,28,108,107,106])){
			$sigers = explode(',',$order['postscript']);
			$ct = count($sigers);
			foreach($sigers as $k=>$v){
				$templateProcessor->setValue('s'.$k,$v); 
			}
			if($order['ptf'] == 23){$j=3;$st=$j-$ct;}
			if($order['ptf'] == 24){$j=4;$st=$j-$ct;}
			if($order['ptf'] == 25){$j=6;$st=$j-$ct;}
			if($st>0){
				for($i=$ct;$i<$j;$i++){
					$templateProcessor->setValue('s'.$i,''); 
				}
			}
		}else{
			$templateProcessor->setValue('signer',$order['postscript']); // On header
		}
	   $templateProcessor->saveAs($resultFile);
		/**
		 * 改变打印状态
		 */
		//var_dump($order['order_id']);
		if($order['order_id']){
			$orderExt = \common\models\OrderExtmModel::find()->where(['order_id'=>$order['order_id']])->one();
			$orderExt->	is_printed = 1;
			$orderExt->save();
		}
		
		//下载文件
		$this->actionDown($resultFile);
	} 
	public function actionPrintedf2($order){
		
		$logo = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png';
		$logo666 = dirname(Yii::$app->BasePath).'/frontend/web/data/system/666.png';
		
		$orderExt = $order['orderExtm'];
		//$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/printed['.$order['order_id'].']'.$order['ptf'].'.docx';
		$filename = 'F'.$order['ptf'].'['.$order['order_id'].']['.$order['postscript'].']送['.$orderExt['consignee'].'].docx';
		$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/'.$filename;
		$phpWord = new PhpWord();
		$fontStyle = [ 'name' => '黑体', 'size' => 20, 'color' =>  '#000000', 'bold' => true ];
		
		$section = $phpWord->addSection(['orientation' => 'landscape',
		//'borderRightSize'=>100,'borderRightColor'=>'#00ffff',
		'marginTop'=>450,'marginBottom'=>450
		]
		);
		$header = $section->addHeader();
		$header->addWatermark($logo, array(
			'width' =>120,
			'height' => 120,
			'spaceAfter'=>100,
			'wrappingStyle' => 'infront', // inline, square, tight, behind, or infront.
			'positioning' => \PhpOffice\PhpWord\Style\Image::POSITION_ABSOLUTE,
			'posHorizontal' => \PhpOffice\PhpWord\Style\Image::POSITION_HORIZONTAL_RIGHT,
			'posHorizontalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
			'posVerticalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
		),['spaceAfter'=>1000]);

		$header->addText('(❊'.$orderExt['address'].'❊)  博艺', ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14, 
		'allCaps' => true, 'doubleStrikethrough' => false],
		['alignment' => \PhpOffice\PhpWord\SimpleType\Jc::END]);

		$section->addText('祝:'. $orderExt['consignee'],array_merge($fontStyle,['size'=>80]),['spaceBefore'=>0,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::START]);
		$section->addText('客斌如云,福开新运',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>1250,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER]);
		$section->addText($order['postscript'].' 恭贺',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>1250,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::END]);

		$footer = $section->addFooter();
		$section->addImage(
		    $logo666,
		    [
				 'width'=>80, 
				 'height'=>80, 
				 'align'=>'left', 
				 'wrappingStyle'=>'square', 
				 'positioning' => 'absolute', 
				 'posHorizontalRel' => 'margin', 
				 'posVerticalRel' => 'line' 
		    ]
		);
		
		$footerText = '❊ 地址：硚口区汉正街华贸2号楼1-81号，电话:13476299284 ❊';
		$footer->addPreserveText($footerText, ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14,], array('spaceAfter'=>100,'alignment' =>\PhpOffice\PhpWord\SimpleType\Jc::CENTER));
		//$section->addTextBreak();
		$footer->addPreserveText('❊ 绿植租赁及销售、鲜花、开业花篮、场地布置、花艺培训、仿真花“博弈花卉”为您私人订制 ❊', ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14,], array('alignment' =>\PhpOffice\PhpWord\SimpleType\Jc::CENTER));

		$objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
		$objWriter->save($resultFile);
		$this->actionDown($resultFile);

	}
	public function actionPrintedf3($order){
		$logo = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png';
		$logo666 = dirname(Yii::$app->BasePath).'/frontend/web/data/system/666.png';
		$orderExt = $order['orderExtm'];
		//$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/printed['.$order['order_id'].']'.$order['ptf'].'.docx';
		$filename = 'F'.$order['ptf'].'['.$order['order_id'].']['.$order['postscript'].']送['.$orderExt['consignee'].'].docx';
		$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/'.$filename;
		$phpWord = new PhpWord();
		$fontStyle = [ 'name' => '黑体', 'size' => 20, 'color' =>  '#000000', 'bold' => true ];
		
		$section = $phpWord->addSection(['orientation' => 'landscape',
			//'borderRightSize'=>100,'borderRightColor'=>'#00ffff','marginBottom'=>0
			'marginRight'=>400,'marginTop'=>0,'marginLeft'=>400,
		]);
		$header = $section->addHeader();
		$header->addWatermark($logo, array(
		'width' =>120,
		'height' => 120,
		'spaceAfter'=>100,
		'wrappingStyle' => 'infront', // inline, square, tight, behind, or infront.
		'positioning' => \PhpOffice\PhpWord\Style\Image::POSITION_ABSOLUTE,
		'posHorizontal' => \PhpOffice\PhpWord\Style\Image::POSITION_HORIZONTAL_RIGHT,
		'posHorizontalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
		'posVerticalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
		//'marginLeft' => 600,
		//'marginTop' => 600
		),['spaceAfter'=>1000]);
		
		$header->addText('(❊'.$orderExt['address'].'❊)         博艺', ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14, 
		'allCaps' => true, 'doubleStrikethrough' => false],
		['alignment' => \PhpOffice\PhpWord\SimpleType\Jc::END]);
		$section->addText('祝:'. $orderExt['consignee'],array_merge($fontStyle,['size'=>80]),['spaceBefore'=>0,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::START]);
		$section->addText('客斌如云,福开新运',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>1250,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER]);
		$section->addText($order['postscript'].' 恭贺',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>1250,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::END]);

           
		$section->addImage(
		    $logo666,
		    [
		        'width' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3),
		        'height' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3),
				'positioning' => 'relative',
				'marginTop' => -1,
				'marginLeft' => -1,
				'width' => 80,
				'height' => 80,
				'wrappingStyle' => 'infront',//['inline', 'behind', 'infront', 'square', 'tight'];
				'wrapDistanceRight' => Converter::cmToPoint(1),
				'wrapDistanceBottom' => Converter::cmToPoint(1),
		    ]
		);
		 

		$footer = $section->addFooter();
 
		$footerText = '❊ 地址：硚口区汉正街华贸2号楼1-81号，电话:13476299284 ❊';
		$footer->addPreserveText($footerText, ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14,], array('spaceAfter'=>100,'alignment' =>\PhpOffice\PhpWord\SimpleType\Jc::CENTER));
		$section->addTextBreak();
		$footer->addPreserveText('❊ 绿植租赁及销售、鲜花、开业花篮、场地布置、花艺培训、仿真花“博弈花卉”为您私人订制 ❊', ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14,], array('alignment' =>\PhpOffice\PhpWord\SimpleType\Jc::CENTER));

		$objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
		$objWriter->save($resultFile);
		$this->actionDown($resultFile);
	}
	public function actionDown($resultFile){
		//输出到浏览器下载
		// header('Content-Description: File Transfer');
		 header('Content-Type: application/octet-stream');
		 header('Content-Disposition: attachment; filename='.basename($resultFile));
		 header('Content-Transfer-Encoding: binary');
		 header('Expires: 0');
		 header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		 header('Pragma: public');
		 header('Content-Length: ' . filesize($resultFile));
		 readfile($resultFile);
	}
	private function getConditions($post, $query = null)
	{	
		if($query === null) {
			foreach(array_keys(ArrayHelper::toArray($post)) as $field) {
				if(in_array($field, ['search_name', 'status', 'add_time_from', 'add_time_to', 'order_amount_from', 'order_amount_to'])) {
					return true;
				}
			}
			return false;
		}
	}
}