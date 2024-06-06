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
		$orderInfo['content'] = $orderInfo['orderExtm']['content'];

		if($post->ptf >=1 && $post->ptf<=100){
			$this->actionExcute($orderInfo);
		}else if($post->ptf >=101 && $post->ptf<=201){
			$this->actionPrinted($orderInfo);
		}else{
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
		$SeleOne = [1=>'生日',2=>'节日',3=>'纪念日',4=>'其他特殊日子'];
		
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
	* 打印开始
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
		$this->actionDown($resultFile);
	}
    //http://shopwind.byhh.com/order_printed/printedf1.html
	public function actionPrinted($order){
		$logo = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png';
		$templateFile = dirname(Yii::$app->BasePath).'/frontend/web/data/template/printed_card_b'.$order['ptf'].'.docx';
		$orderExt = $order['orderExtm'];
		$specialChars = array("$", "#", "@", "!", "^", "&", "*");
		$orderExt['consignee'] = str_replace($specialChars, '', $orderExt['consignee']);
		//$orderExt['consignee'] = preg_replace('/[^a-zA-Z0-9\s]/', '', $orderExt['consignee']);
		$filename = 'F'.$order['ptf'].'['.$order['order_id'].']送['.$orderExt['consignee'].'].docx';
		$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/'.$filename;
		
		// 创建新文档
		$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($templateFile);
		$templateProcessor->setValue('address',$orderExt['address']);// On section/content
		$templateProcessor->setValue('title', $orderExt['consignee']);// On footer
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

		$templateProcessor->saveAs($resultFile);
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
}