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
use common\library\Resource;

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
		$this->params = ArrayHelper::merge($this->params, Page::getAssign('user'));
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

		if($post->ptf >=1 && $post->ptf<=20){
			$this->actionExcute($orderInfo);
		}else if($post->ptf >=21 && $post->ptf<=30){
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
		
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id','ptf']);
		//var_dump($post);
		$this->params['order_id'] = $post->order_id;
		$this->params['cardsA'] =[
			['k'=>'wpsa01','w'=>'10.8cm','h'=>'7.5cm'],
			['k'=>'wpsa02','w'=>'24cm','h'=>'12cm'],
			['k'=>'wpsa03','w'=>'12.5cm','h'=>'19cm'],
			['k'=>'wpsa04','w'=>'18.8cm','h'=>'14cm'],
			['k'=>'wpsa05','w'=>'9cm','h'=>'9cm'],
			['k'=>'wpsa06','w'=>'18.8cm','h'=>'14cm'],
			['k'=>'wpsa07','w'=>'12cm','h'=>'9cm'],
			['k'=>'wpsa08','w'=>'9.8cm','h'=>'14cm'],
			['k'=>'wpsa09','w'=>'8cm','h'=>'14cm'],
			['k'=>'wpsa10','w'=>'9.1cm','h'=>'11cm'],
			['k'=>'wpsa11','w'=>'11cm','h'=>'9.1cm']
		];
		$this->params['cardsB'] =[
			['k'=>'wpsb01','w'=>'29.7cm','h'=>'21cm'],
			['k'=>'wpsb02','w'=>'29.7cm','h'=>'21cm'],
			['k'=>'wpsb03','w'=>'29.7cm','h'=>'21cm'],
			['k'=>'wpsb04','w'=>'29.7cm','h'=>'21cm'],
			['k'=>'wpsb05','w'=>'29.7cm','h'=>'21cm'],
			['k'=>'wpsb06','w'=>'29.7cm','h'=>'21cm'],
			['k'=>'wpsb07','w'=>'29.7cm','h'=>'21cm'],
			['k'=>'wpsb08','w'=>'29.7cm','h'=>'21cm'],
			['k'=>'wpsb09','w'=>'29.7cm','h'=>'21cm']
		];
		$this->params['_foot_tags'] = Resource::import([
			'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js, dialog/dialog.js',
            'style' =>  'jquery.ui/themes/smoothness/jquery.ui.css,dialog/dialog.css'
		]);
		return $this->render('../printed.list.html', $this->params);
	}
	public function actionIview(){
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id','ptf']);
		$this->params['dialog_id'] = $post->dialog_id;
		if(stripos("find-".$post->dialog_id,'a')){
			$this->params['dialog_show'] = 'a-action';
			//$ns = str_split($this->params['dialog_id']);
			preg_match('/\d+/',$this->params['dialog_id'],$matchs);
			//var_dump($matchs);die;
			$this->params['cardsA'] =[['id'=>'a'.$matchs[0]],['id'=>'a'.$matchs[0].'-1']];
		}else if(stripos("find-".$post->dialog_id,'b')){
			$this->params['dialog_show'] = 'b-action';
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