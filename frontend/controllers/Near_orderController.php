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
use common\library\Language;
use common\library\Message;
use common\library\Resource;
use common\library\Timezone;
use common\library\Page;
use common\library\Plugin;
use common\library\Taskqueue;

/**
 * @Id Near_orderController.php 2018.5.16 $
 * @author mosir
 */

class Near_orderController extends \common\controllers\BaseSellerController
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

    public function actionIndex()
    {
		$post = Basewind::trimAll(Yii::$app->request->get(), true);
		$curmenu = empty($post->type) ? 'all_orders' : $post->type.'_orders';
		//var_dump(Language::get('seller_order'));
		$model = new \frontend\models\Seller_orderForm(['store_id' => $this->visitor['store_id']]);
		list($orders, $page) = $model->formData($post, 20);
		//var_dump($lang);die;
		$this->params['orders'] = $orders;
		$this->params['pagination'] = Page::formatPage($page);
		$this->params['filtered'] = $model->getConditions($post);
		$this->params['enable_express'] = Plugin::getInstance('express')->autoBuild();
		
		$this->params['_foot_tags'] = Resource::import([
			'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js,jquery.plugins/jquery.validate.js,dialog/dialog.js,jquery.plugins/jquery.PrintArea.js',
            'style' =>  'jquery.ui/themes/smoothness/jquery.ui.css,dialog/dialog.css'
		]);
		
		// 当前位置
		//$t = Language::get($curmenu);

		//var_dump(Language::get('seller_order'));die;
		$this->params['_curlocal'] = Page::setLocal(Language::get('near_order'), Url::toRoute('near_order/index'), Language::get($curmenu));
		//var_dump($this->params['_curlocal']);die;



		// 当前用户中心菜单
		$this->params['_usermenu'] = Page::setMenu('near_order', $curmenu);
		
		$this->params['page'] = Page::seo(['title' => Language::get($curmenu)]);
        return $this->render('../near_order.index.html', $this->params);
	}
	
	public function actionView()
    {
		$post = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id']);

		$model = new \frontend\models\Seller_orderViewForm(['store_id' => $this->visitor['store_id']]);
		if(!($orderInfo = $model->formData($post))) {
			return Message::warning($model->errors);
		}
		var_dump($orderInfo);
		$this->params['order'] = $orderInfo;
		
		// 当前位置
		$this->params['_curlocal'] = Page::setLocal(Language::get('seller_order'), Url::toRoute('seller_order/index'), Language::get('order_detail'));
		
		// 当前用户中心菜单
		$this->params['_usermenu'] = Page::setMenu('seller_order', 'order_detail');

		$this->params['page'] = Page::seo(['title' => Language::get('order_detail')]);
        return $this->render('../seller_order.view.html', $this->params);
	}
	
	/* 调整费用 */
    public function actionAdjustfee()
    {
		$get = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id']);
		
		$model = new \frontend\models\Seller_orderAdjustfeeForm(['store_id' => $this->visitor['store_id']]);
		if(!($orderInfo = $model->formData($get))) {
			return Message::warning($model->errors);
		}
		
        if (!Yii::$app->request->isPost)
        {
			$this->params['order'] = $orderInfo;
			
			// 当前位置
			//$this->params['_curlocal'] = Page::setLocal(Language::get('seller_order'), Url::toRoute('seller_order/index'), Language::get('adjust_fee'));
		
			// 当前用户中心菜单
			//$this->params['_usermenu'] = Page::setMenu('seller_order', 'adjust_fee');

			$this->params['page'] = Page::seo(['title' => Language::get('adjust_fee')]);
			return $this->render('../seller_order.adjust_fee.html', $this->params);
        }
        else
        {
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			if(!$model->submit($post, $orderInfo)) {
				return Message::popWarning($model->errors);
			}
            return Message::popSuccess();
        }
    }
	
	/* 待发货的订单发货 */
    public function actionShipped()
    {
		$get = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id']);
		
		$model = new \frontend\models\Seller_orderShippedForm(['store_id' => $this->visitor['store_id']]);
		if(!($orderInfo = $model->formData($get))) {
			return Message::warning($model->errors);
		}
		
        if (!Yii::$app->request->isPost)
        {
			$this->params['order'] = $orderInfo;

			if(($expresser = Plugin::getInstance('express')->autoBuild())) {
				$this->params['express_company'] = $expresser->getCompanys();
			}
			
			// 当前位置
			//$this->params['_curlocal'] = Page::setLocal(Language::get('seller_order'), Url::toRoute('seller_order/index'), Language::get('shipped_order'));
		
			// 当前用户中心菜单
			//$this->params['_usermenu'] = Page::setMenu('seller_order', 'shipped_order');

			$this->params['page'] = Page::seo(['title' => Language::get('shipped_order')]);
			return $this->render('../seller_order.shipped.html', $this->params);
		} 
		else
		{
			$post = Basewind::trimAll(Yii::$app->request->post(), true);
			if(!$model->submit($post, $orderInfo)) {
				return Message::popWarning($model->errors);
			}
            return Message::popSuccess();
		}
    }
	
	/* 取消订单（没付款之前） */
	public function actionCancel()
	{
		$get = Basewind::trimAll(Yii::$app->request->get(), true);
		
		$model = new \frontend\models\Seller_orderCancelForm(['store_id' => $this->visitor['store_id']]);
		if(!($orders = $model->formData($get))) {
			return Message::warning($model->errors);
		}

		if(!Yii::$app->request->isPost)
		{
			$this->params['orders'] = $orders;
			$this->params['order_id'] = implode(',', array_keys($orders));
			
			// 当前位置
			//$this->params['_curlocal'] = Page::setLocal(Language::get('seller_order'), Url::toRoute('seller_order/index'), Language::get('cancel_order'));
		
			// 当前用户中心菜单
			//$this->params['_usermenu'] = Page::setMenu('seller_order', 'cancel_order');

			$this->params['page'] = Page::seo(['title' => Language::get('cancel_order')]);
			return $this->render('../seller_order.cancel.html', $this->params);
		}
		else
		{
            $post = Basewind::trimAll(Yii::$app->request->post(), true);
            if(!$model->submit($post, $orders)) {
				return Message::popWarning($model->errors);
			}
            return Message::popSuccess();
		}
	}
	
	/* 卖家给订单添加备忘 */
    public function actionMemo()
    {
        $get = Basewind::trimAll(Yii::$app->request->get(), true, ['order_id']);
		
		$model = new \frontend\models\Seller_orderMemoForm(['store_id' => $this->visitor['store_id']]);
		if(!($orderInfo = $model->formData($get))) {
			return Message::warning($model->errors);
		}

        if (!Yii::$app->request->isPost)
        {
			$this->params['order'] = $orderInfo;
			
			// 当前位置
			//$this->params['_curlocal'] = Page::setLocal(Language::get('seller_order'), Url::toRoute('seller_order/index'), Language::get('memo_order'));
		
			// 当前用户中心菜单
			//$this->params['_usermenu'] = Page::setMenu('seller_order', 'memo_order');

			$this->params['page'] = Page::seo(['title' => Language::get('memo_order')]);
			return $this->render('../seller_order.memo.html', $this->params);
        }
        else
        {
			$post = Basewind::trimAll(Yii::$app->request->post(), true, ['flag']);
            if(!$model->submit($post, $orderInfo)) {
				return Message::popWarning($model->errors);
			}
			return Message::popSuccess();
        }
    }
	
	// 卖家打印订单
	public function actionPrinted()
	{
		$get = Basewind::trimAll(Yii::$app->request->get(), true);
		
		$model = new \frontend\models\Seller_orderPrintedForm(['store_id' => $this->visitor['store_id']]);
		if(!($orders = $model->formData($get))) {
			return Message::warning($model->errors);
		}

        if (!Yii::$app->request->isPost)
        {
			$this->params['orders'] = $orders;
			$this->params['order_id'] = implode(',', array_keys($orders));
			$this->params['now'] = Timezone::gmtime();
			
			$this->params['_foot_tags'] = Resource::import('jquery.plugins/jquery.PrintArea.js');
			
			// 当前位置
			//$this->params['_curlocal'] = Page::setLocal(Language::get('seller_order'), Url::toRoute('seller_order/index'), Language::get('printed_order'));
		
			// 当前用户中心菜单
			//$this->params['_usermenu'] = Page::setMenu('seller_order', 'printed_order');

			$this->params['page'] = Page::seo(['title' => Language::get('printed_order')]);
            return $this->render('../near_order.printed.html', $this->params);
        }
        else
        {
			return Message::popSuccess();
		}
	}

	public function actionPrinteds(){
 		 $objPHPExcel = new \PHPExcel();
 		// 方向和纸张尺寸:
 		//$objPHPExcel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
		//$objPHPExcel->getActiveSheet()->getPageSetup()->setPaperSize(PHPExcel_Worksheet_PageSetup::PAPERSIZE_A4);
		//1 打印标题（固定表头）
		$objPHPExcel->getActiveSheet()->getPageSetup()->setRowsToRepeatAtTopByStartAndEnd(1, 1);
		//2 横向打印
		$objPHPExcel->getActiveSheet()->getPageSetup()->setOrientation(\PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
		//3 打印自动调整
		$objPHPExcel->getActiveSheet()->getPageSetup()->setFitToWidth(1);
		$objPHPExcel->getActiveSheet()->getPageSetup()->setFitToHeight(0);
		//4 在header加入图片
		$company_name = '博艺花卉';
		$objDrawing = new \PHPExcel_Worksheet_HeaderFooterDrawing();
		$objDrawing->setName('Logo');
		$objDrawing->setDescription('Logo');
		$objDrawing->setPath(dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png');
		$objDrawing->setHeight(30);
		$objPHPExcel->getActiveSheet()->getHeaderFooter()->addImage($objDrawing, \PHPExcel_Worksheet_HeaderFooter::IMAGE_HEADER_LEFT);
		$objPHPExcel->getActiveSheet()->getHeaderFooter()->setOddHeader('&L&G' . '&R&9&B&"MS Gothic"' . $company_name);
 		//6.循环刚取出来的数组，将数据逐一添加到excel表格。
        for($i=0;$i<6;$i++){
            $objPHPExcel->getActiveSheet()->setCellValue('A'.($i+2),'id');//添加ID
            $objPHPExcel->getActiveSheet()->setCellValue('B'.($i+2),'username');//添加用户名
            $objPHPExcel->getActiveSheet()->setCellValue('C'.($i+2),'phone');//添加手机号码
            $objPHPExcel->getActiveSheet()->setCellValue('D'.($i+2),'create_time');//添加创建时间
        }
		//print_r($dataArray);
		 //7.设置保存的Excel表格名称
        $filename = '管理员'.date('ymd',time()).'.xls';
        //8.设置当前激活的sheet表格名称；
        $objPHPExcel->getActiveSheet()->setTitle('管理员列表');
        //9.设置浏览器窗口下载表格
	        header("Content-Type: application/force-download");
	        header("Content-Type: application/octet-stream");
	        header("Content-Type: application/download");
	     //   header('Content-Disposition:inline;filename="'.$filename.'"');
        //生成excel文件
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        //下载文件在浏览器窗口
        //$objWriter->save('php://output');
        $objWriter->save(dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.xls');
        exit;


	}
	
	public function actionPrintedw(){
 
	$logo = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhgzh.png';
	$logo2 = dirname(Yii::$app->BasePath).'/frontend/web/data/system/byhhxcx.jpg';
	$docx = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/printed_result2.docx';
	$templateFile = dirname(Yii::$app->BasePath).'/frontend/web/data/printed_template2.docx';
	/*
	// 创建新文档
	$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($templateFile);
	// Variables on different parts of document
	$templateProcessor->setValue('address','云尚3F、3E012');            // On section/content
	$templateProcessor->setValue('title', '低调空间');             // On footer
	$templateProcessor->setValue('signer', '万宝纺织'); // On header
	//$templateProcessor->setImg('Image',['src' => $logo]);
	
	$templateProcessor->setImageValue('im2',$logo2);
	$templateProcessor->setImageValue('im', array('path' => $logo,'wrappingStyle' => 'infront', 'width' => 120,
		'height' => 120));
	$templateProcessor->setImageValue('FeatureImage', function () {
	    // Closure will only be executed if the replacement tag is found in the template
	    return array('path' => SlowFeatureImageGenerator::make(), 'width' => 240,'height' => 240,'ratio' => false);
	});
	$templateProcessor->saveAs($docx);
	//输出到浏览器下载
	 header('Content-Description: File Transfer');
	 header('Content-Type: application/octet-stream');
	 header('Content-Disposition: attachment; filename='.basename($docx));
	 header('Content-Transfer-Encoding: binary');
	 header('Expires: 0');
	 header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
	 header('Pragma: public');
	 header('Content-Length: ' . filesize($docx));
	 readfile($docx);
	*/	 
 
		$phpWord = new PhpWord();
		$fontStyle = [
			'name' => '黑体',// 'Microsoft Yahei UI',
			'size' => 20,
			'color' =>  '#000000',
			'bold' => true
		];
		$section = $phpWord->addSection(['orientation' => 'landscape',
		//'borderRightSize'=>100,'borderRightColor'=>'#00ffff',
		'marginTop'=>450,'marginBottom'=>450
		]
		);
		$header = $section->addHeader();
		$header->addWatermark($logo, array(
			'width' =>110,
			'height' => 110,
			'spaceAfter'=>100,
			'wrappingStyle' => 'infront', // inline, square, tight, behind, or infront.
			'positioning' => \PhpOffice\PhpWord\Style\Image::POSITION_ABSOLUTE,
			'posHorizontal' => \PhpOffice\PhpWord\Style\Image::POSITION_HORIZONTAL_RIGHT,
			'posHorizontalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
			'posVerticalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
		),['spaceAfter'=>1000]);
	  
	  //$headers = $section->getHeaders();
	  //$header1 = $headers[1]; // note that the first index is 1 here (not 0)
	  
	  //$elements = $header1->getElements();
	  //var_dump($elements);die;
	  
	  
		$header->addText('(玉龙路168号附9)  博艺', ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14, 
		'allCaps' => true, 'doubleStrikethrough' => false],
		['alignment' => \PhpOffice\PhpWord\SimpleType\Jc::END]);

		//$section = $phpWord->addSection();
		$section->addText('祝:艺欣调养馆',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>0,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::START]);
		//$section->addTextBreak();
		// $section = $phpWord->addSection();
		$section->addText('客斌如云,福开新运',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>1250,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER]);
		//$section->addTextBreak();
		//$section = $phpWord->addSection();
		$section->addText('圣天包装 恭贺',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>1250,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::END]);

		$footer = $section->addFooter();
		$footerText = '地址：硚口区汉正街华贸2号楼1-81号，电话:13476299284';
		$footer->addPreserveText($footerText, ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14,], array('spaceAfter'=>100,'alignment' =>\PhpOffice\PhpWord\SimpleType\Jc::CENTER));
		//$section->addTextBreak();
		$footer->addPreserveText('****绿植租赁及销售、鲜花、开业花篮、场地布置、花艺培训、仿真花“博弈花卉”为您私人订制****', ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14,], array('alignment' =>\PhpOffice\PhpWord\SimpleType\Jc::CENTER));

		$section->addPageBreak();
		$fontStyle = [
			'name' => '黑体',// 'Microsoft Yahei UI',
			'size' => 20,
			'color' =>  '#000000',
			'bold' => true
		];
		$section = $phpWord->addSection(['orientation' => 'landscape',
		//'borderRightSize'=>100,'borderRightColor'=>'#00ffff',
		'marginRight'=>400,'marginTop'=>0,'marginLeft'=>400,'marginBottom'=>0
		]
		);
		$header = $section->addHeader();
		$header->addWatermark($logo, array(
		  'width' =>110,
		  'height' => 110,
		  'spaceAfter'=>100,
		  'wrappingStyle' => 'infront', // inline, square, tight, behind, or infront.
		 'positioning' => \PhpOffice\PhpWord\Style\Image::POSITION_ABSOLUTE,
		  'posHorizontal' => \PhpOffice\PhpWord\Style\Image::POSITION_HORIZONTAL_RIGHT,
		  'posHorizontalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
		  'posVerticalRel' => \PhpOffice\PhpWord\Style\Image::POSITION_RELATIVE_TO_PAGE,
		  'marginLeft' => 600,
		  'marginTop' => 600
		),['spaceAfter'=>1000]);
		$header->addText('(汇江广场5F)         博艺', ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14, 
		'allCaps' => true, 'doubleStrikethrough' => false],
		['alignment' => \PhpOffice\PhpWord\SimpleType\Jc::END]);

		//$section = $phpWord->addSection();
		$section->addText('祝:百泓服饰',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>0,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::START]);
		//$section->addTextBreak();
		// $section = $phpWord->addSection();
		$section->addText('客斌如云,福开新运',array_merge($fontStyle,['size'=>90]),['spaceBefore'=>1250,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER]);
		//$section->addTextBreak();
		//$section = $phpWord->addSection();
		$section->addText('根聚地 周诗发 恭贺',array_merge($fontStyle,['size'=>80]),['spaceBefore'=>1250,'alignment' => \PhpOffice\PhpWord\SimpleType\Jc::END]);

		//$footer = $section->addFooter();
		//$footerText = '地址：硚口区汉正街华贸2号楼1-81号，电话:13476299284';
		//$footer->addPreserveText($footerText, ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14,], array('spaceAfter'=>100,'alignment' =>\PhpOffice\PhpWord\SimpleType\Jc::CENTER));
		//$section->addTextBreak();
		//$footer->addPreserveText('****绿植租赁及销售、鲜花、开业花篮、场地布置、花艺培训、仿真花“博弈花卉”为您私人订制****', ['bold' => true,'name' => '黑体','spacing'=>20, 'colsSpace'=>220,'italic' => false, 'size' => 14,], array('alignment' =>\PhpOffice\PhpWord\SimpleType\Jc::CENTER));











		$objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
		$objWriter->save($docx);
	}
	public function actionDown(){
		$docx = dirname(Yii::$app->BasePath).'/frontend/web/data/sales/printed_result.docx';
		
		//输出到浏览器下载
		 header('Content-Description: File Transfer');
		 header('Content-Type: application/octet-stream');
		 header('Content-Disposition: attachment; filename='.basename($docx));
		 header('Content-Transfer-Encoding: binary');
		 header('Expires: 0');
		 header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		 header('Pragma: public');
		 header('Content-Length: ' . filesize($docx));
		 readfile($docx);
	}
	/* 三级菜单 */
    public function getUserSubmenu()
    {
        $submenus =  array(
            array(
                'name'  => 'all_orders',
                'url'   => Url::toRoute('near_order/index'),
            ),
			array(
                'name'  => 'pending_orders',
                'url'   => Url::toRoute(['near_order/index', 'type' => 'pending']),
            ),
			array(
                'name'  => 'teaming_orders',
                'url'   => Url::toRoute(['near_order/index', 'type' => 'teaming']),
            ),
			array(
                'name'  => 'accepted_orders',
                'url'   => Url::toRoute(['near_order/index', 'type' => 'accepted']),
            ),
			array(
                'name'  => 'shipped_orders',
                'url'   => Url::toRoute(['near_order/index', 'type' => 'shipped']),
            ),
			array(
                'name'  => 'finished_orders',
                'url'   => Url::toRoute(['near_order/index', 'type' => 'finished']),
            ),
			array(
                'name'  => 'canceled_orders',
                'url'   => Url::toRoute(['near_order/index', 'type' => 'canceled']),
            ),
        );
	
        return $submenus;
    }
}