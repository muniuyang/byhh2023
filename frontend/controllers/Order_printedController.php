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
		if($post->ptf >=1 && $post->ptf<=20){
			$this->actionExcute($orderInfo);
		}else if($post->ptf ==21){
			$this->actionPrintedf1($orderInfo);
		}else if($post->ptf ==22){
			$this->actionPrintedf2($orderInfo);
		}else if($post->ptf ==23){
			$this->actionPrintedf3($orderInfo);
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
		return $this->render('../printed.list.html', $this->params);
	}
	/**
	* 打印开始
	*/
	public function actionExcute($order){

		$logo = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png';
		$templateFile = dirname(Yii::$app->BasePath).'/frontend/web/data/template/printed_card_a00'.$order['ptf'].'.docx';
		$orderExt = $order['orderExtm'];
		$filename = 'F'.$order['ptf'].'['.$order['order_id'].']['.$order['postscript'].']送['.$orderExt['consignee'].'].docx';
		$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/'.$filename;
		// 创建新文档
		$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($templateFile);
		$templateProcessor->setValue('signer',$order['postscript']); 
		$templateProcessor->saveAs($resultFile);
		$this->actionDown($resultFile);
	}
    //http://shopwind.byhh.com/order_printed/printedf1.html
	public function actionPrintedf1($order){
		$logo = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png';
		$templateFile = dirname(Yii::$app->BasePath).'/frontend/web/data/template/printed_template.docx';
		$orderExt = $order['orderExtm'];
		//$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/printed['.$order['order_id'].']'.$order['ptf'].'.docx';
		$filename = 'F'.$order['ptf'].'['.$order['order_id'].']['.$order['postscript'].']送['.$orderExt['consignee'].'].docx';
		$resultFile = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/'.$filename;
		
		// 创建新文档
		$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($templateFile);
		// Variables on different parts of document
		$templateProcessor->setValue('address',$orderExt['address']);// On section/content
		$templateProcessor->setValue('title', $orderExt['consignee']);// On footer
		$templateProcessor->setValue('signer',$order['postscript']); // On header
		/*
		$templateProcessor->setImageValue('im',$logo);
		$templateProcessor->setImageValue('im', array('path' => $logo,'wrappingStyle' => 'infront', 'width' => 120,'height' => 120));
		$templateProcessor->setImageValue('FeatureImage', function () {
			 Closure will only be executed if the replacement tag is found in the template
			return array('path' => SlowFeatureImageGenerator::make(), 'width' => 240,'height' => 240,'ratio' => false);
		});
		*/
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