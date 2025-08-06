<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace common\library;

use yii;
use yii\web\Response;
use yii\helpers\ArrayHelper;
use yii\helpers\FileHelper;
use yii\helpers\Url;

use common\models\DistributeModel;

use common\library\Basewind;
use common\library\Setting;
use PHPExcel;
use PHPExcel_IOFactory;
/**
 * @Id Pageoutdown.php 2023.9.27 $
 * @author jcheng
 */
 
class Pageoutdown
{
	
	
	public static $tmpPath = '@runtime/export';
	/**
	 * 导出xlsx文件
	 */
	public static function export($config = [])
	{
		$objPHPExcel = new PHPExcel();
		//var_dump($config);die;
		///*
		header('Content-disposition: attachment; filename="'.self::sanitize_filename($config['fileName']).'.xlsx"');
		header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		header('Content-Transfer-Encoding: binary');
		header('Cache-Control: must-revalidate');
		header('Pragma: public');
		//*/
 

		//$objPHPExcel->setTempDir(Yii::getAlias('@frontend/runtime'));
		$objPHPExcel = self::phpExcel($objPHPExcel , $config,[]);
		//die('33');
		/*
				// Redirect output to a client’s web browser (Excel2007)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		//header('Content-Disposition: attachment;filename="01simple.xlsx"');
		header('Content-disposition: attachment; filename="'.self::sanitize_filename($config['fileName']).'.xlsx"');

		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');

		// If you're serving to IE over SSL, then the following may be needed
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0
		*/
		//die('33');
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter->save('php://output');

		exit(0);
	}
	public static function sanitize_filename($filename)
	{
		$nonprinting = array_map('chr', range(0,31));
		$invalid_chars = array('<', '>', '?', '"', ':', '|', '\\', '/', '*', '&');
		$all_invalids = array_merge($nonprinting,$invalid_chars);
		return str_replace($all_invalids, "", $filename);
	}
	public static function phpExcel($objPHPExcel,$sheelsData,$params=[])
	{
		//var_dump($sheelsData);

        //格式设置
        $araes = 'A1:Z3';

        //第一行设置，等于-1自动行高
        $objPHPExcel->getActiveSheet()->getRowDimension($araes)->setRowHeight(30);
        //设置默认行高
        $objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(25.5); 
        //$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(5);//设置行宽
      	
        //合并单元格
      // $objPHPExcel->getActiveSheet()->mergeCells('A1:Z1');

		//设置文字水平居左（HORIZONTAL_LEFT，默认值）中（HORIZONTAL_CENTER）右（HORIZONTAL_RIGHT）
		$objPHPExcel->getActiveSheet()->getStyle('A1:Z300')->getAlignment()
			->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		//垂直居中
		$objPHPExcel->getActiveSheet()->getStyle('A1:Z300')->getAlignment()
			->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
				
		//设置填充颜色
		$objPHPExcel->getActiveSheet()->getStyle('A3:Z3')->getFill()
			->setFillType(\PHPExcel_Style_Fill::FILL_SOLID);
		//设置填充颜色
		$objPHPExcel->getActiveSheet()->getStyle('A3:Z3')->getFill()
			->getStartColor()->setARGB('00BFFF');
		//设置是否加粗
		//$objPHPExcel->getActiveSheet()->getStyle($araes)->getFont()->setBold(true);
		//设置文字颜色
		$objPHPExcel->getActiveSheet()->getStyle('A3:Z3')->getFont()->getColor()
			->setARGB(\PHPExcel_Style_Color::COLOR_WHITE);
		//Set document properties
		$objPHPExcel->getActiveSheet()->getDefaultStyle()->getFont()->setName('微软雅黑');
		$objPHPExcel->getActiveSheet()->getStyle('A3:Z3')->getFont()->setBold(true)
                    ->setName('微软雅黑')->setSize(12)->getColor()->setRGB('FFFFFF');

		$objPHPExcel->getProperties()->setCreator("博艺花卉")
									 ->setLastModifiedBy("程进:15210723549")
									 ->setTitle("博艺花卉客户对账单")
									 ->setSubject("客户对账单仅供客户使用，不允许外泄或传播")
									 ->setDescription("博艺花卉客户对账单统计系统")
									 ->setKeywords("对账单、流水")
									 ->setCategory("对账单文件导出");

		$cells = str_split('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
		$nsheelsData = self::defaultRecord($sheelsData);
		//var_export($nsheelsData);die;
		$header = array_slice($nsheelsData, 0,3);

		foreach($header as $hk=>$hval){//行
	 		foreach($hval as $k=>$v){//列
	 			$cell = $cells[$k].($hk+1);
				$objPHPExcel->setActiveSheetIndex(0)->setCellValue($cell, $v);
			}
		}

		$body = array_slice($nsheelsData, 3);
		$sumTitle = $sumOne = '';$sumTwo='';$sumThree='';$total = 0;
		foreach($body as $key=>$record){
			$i=0;
			self::outImageRecord($objPHPExcel,$key+4,$record);
	 		foreach($record as $k=>$v){
	 			$cell = $cells[$i].($key+4);
				if('goods_image' == $k ){
					$w = 4.25;
				}else{
					$objPHPExcel->setActiveSheetIndex(0)->setCellValue($cell, $v);
					if(in_array($k,['goods_amount','shipping_fee'])){
						//设置删除线（全局）
						//$objPHPExcel->getDefaultStyle()->getFont()->setStrikethrough(true); 
						//设置删除线（单元格）
						$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->setStrikethrough(true);
						$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()->setARGB('FF0000');
					}
					//设置行高
					if(in_array($k,['postscript','pay_message'])){$w = 38;}
					else if(in_array($k,['address'])){$w = 28;}
					else if(in_array($k,['goods_name'])){$w = 24;}
					else if(in_array($k,['add_time'])){$w = 22;}
					else if(in_array($k,['order_sn','consignee','store_name','signature','real_name','phone_mob'])){$w = 14;}
					else if(in_array($k,['status','payment_name','send_date'])){$w = 13;}
					else if(in_array($k,['goods_amount','shipping_fee','order_amount'])){$w = 7;}
					//else if('goods_image' == $k ){$w = 10;}
					else if('ID' == $k ){$w = 2;}
					else{$w = 5;}
				}
				$objPHPExcel->getActiveSheet()->getColumnDimension($cells[$i])->setWidth($w);
				//设置单元格为文本格式，很有用
				if(in_array($k,['order_sn'])){
		       		$objPHPExcel->getActiveSheet()->getStyle($cells[$i])
		        		->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_TEXT);
		        }
				//设置字颜色
				if(in_array($k,['real_name','order_amount'])){
					$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()
								->setARGB('00AA00');	
				}
				if(in_array($k,['consignee','signature','address','phone_mob'])){
					$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()
								->setARGB('FF8800');	
				}
				if('等待卖家发货' == $v && $k== 'status'){
					$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()
								->setARGB(\PHPExcel_Style_Color::COLOR_DARKGREEN);
				}else if('卖家已发货' == $v && $k== 'status'){
					$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()
								->setARGB('00BFFF');
				}else if('等待买家付款' == $v && $k== 'status'){
					$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()
								->setARGB('FF6600');
				}else if('交易退款' == $v && $k== 'status'){
					$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()
								->setARGB(\PHPExcel_Style_Color::COLOR_RED);
				}else if('交易完成' == $v && $k== 'status'){
					$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()
								->setARGB(\PHPExcel_Style_Color::COLOR_GREEN);
				}else if('交易关闭' == $v && $k== 'status'){
					$objPHPExcel->getActiveSheet()->getStyle($cell)->getFont()->getColor()
								->setARGB(\PHPExcel_Style_Color::COLOR_BLACK);
				}
				//设置位置
				if(in_array($k,['address','status','goods_name'])){
					//echo "<br/>".$cells[$i]."(".$i.")"."(".$key.")===>(".$k.")".$v."<br/>";
					$objPHPExcel->getActiveSheet()->getStyle($cells[$i])->getAlignment()
						->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
				}else{
					//echo "<br/>2".$cells[$i]."(".$i.")"."(".$key.")===>(".$k.")".$v."<br/>";
					$objPHPExcel->getActiveSheet()->getStyle($cells[$i])->getAlignment()
						->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
				}
				
				
				
				//求和设置上
				if('order_amount' == $k){$sumOne = $cells[$i];}
				if('shipping_fee' == $k){$sumTwo = $cells[$i];}
				if('goods_amount' == $k){$sumThree = $cells[$i];}
				if('real_name' == $k){$sumTitle = $cells[$i];}
				$i++;
			}
			$total++;
		}
		//求和设置下
		$objPHPExcel->getActiveSheet()
				//->setCellValue($sumTitle.(2), "总计")
				->setCellValue($sumOne.(2), "=SUM(".$sumOne."4:".$sumOne.($total+4).")")
				->setCellValue($sumTwo.(2), "=SUM(".$sumTwo."4:".$sumTwo.($total+4).")")
				->setCellValue($sumThree.(2), "=SUM(".$sumThree."4:".$sumThree.($total+4).")");

		//冻结第一行
		$objPHPExcel->setActiveSheetIndex(0);
		$objPHPExcel->getActiveSheet()->freezePane('A4');
		$sheetName = $sheelsData['sheetName'] ? $sheelsData['sheetName']:'流水';
		$objPHPExcel->getActiveSheet()->setTitle($sheetName);
		
		// Set active sheet index to the first sheet, so Excel opens this as the first sheet
		return $objPHPExcel;
	}
	public static function defaultRecord( $list ){
		$rlist = [];
		$nlist = [];
		foreach ($list['models'] as $ke => $val) {
			if(count($val)>6){
				$nlist[] = $val;	
			}
		}
		//var_dump($nlist);
		foreach ($nlist[0] as $ke => $val) {
			if(in_array($val,['售价','运费','金额'])){
				$rlist[0][$ke] = "总计";
			}else if(in_array($val,['订单状态'])){
				$rlist[0][$ke] = "合计";
			}else{
				$rlist[0][$ke] = '';
			}
			$rlist[1][] = '';

		}
		$list = array_merge($rlist,$nlist);
		return $list;
	}
	public static function outImageRecord($objPHPExcel,$k, $v){
		$v['goods_image_path'] = strstr($v['goods_image'],'data');
		if(!empty($v['goods_image'])) {
			$objDrawing[$k] = new \PHPExcel_Worksheet_Drawing();			
			if (file_exists($v['goods_image_path'])) {
				// 图片生成 poster
				$objDrawing[$k]->setPath($v['goods_image_path']);
				// 设置宽度高度
				$objDrawing[$k]->setHeight(30);//照片高度
				$objDrawing[$k]->setWidth(30); //照片宽度
				//设置图片要插入的单元格
				$objDrawing[$k]->setCoordinates('A' . $k);
				// 图片偏移距离
				$objDrawing[$k]->setOffsetX(5);
				$objDrawing[$k]->setOffsetY(5);
				$objDrawing[$k]->setWorksheet($objPHPExcel->getActiveSheet());
			}
		}
	}
	public static function download($url, $path = './runtime/export/')
	{
	    $ch = curl_init();
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 90);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 信任任何证书
	    $file = curl_exec($ch);
	    curl_close($ch);
	    $filename = pathinfo($url, PATHINFO_BASENAME);
	    $resource = fopen($path . $filename, 'w');
	    fwrite($resource, $file);
	    fclose($resource);
	    return $filename;
	}
 
	public static function writeLog($key = '', $word = '') 
	{
		//$word = json_encode($word); // for AJAX debug
		$word = var_export($word, true);

		$path = dirname(Yii::getAlias('@frontend')) . "/.logs/" . date('Ymd', time());
		@mkdir($path, 0777, true);
			
		$fp = fopen($path ."/log.txt","a");
		flock($fp, LOCK_EX) ;
		fwrite($fp,$key." At:".date("Y-m-d H:i:s",time())."[IP:".Yii::$app->request->userIP."]\n".$word."\n");
		flock($fp, LOCK_UN);
		fclose($fp);
	}
}