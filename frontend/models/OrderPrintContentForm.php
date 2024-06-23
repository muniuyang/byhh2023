<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace frontend\models;

use Yii;
use yii\base\Model;

use common\models\OrderPrintContentModel;

use common\library\Basewind;
use common\library\Language;

/**
 * @Id OrderPrintContentForm.php 2024.5.25 $
 * @author jcheng
 */
class OrderPrintContentForm extends Model
{
	public $id = 0;
	public $errors = null;

	public function valid($post)
	{
		//var_dump($post);die;
		if(!$post->id && empty($post->pid)) {
			$this->errors = "请选择分类一";
			return false;
		}
		if(!$post->id && !$post->cid) {
			$this->errors = "请选择分类二";
			return false;
		}
		if(!$post->id && empty($post->content)) {
			$this->errors = "请填写卡片内容";
			return false;
		}
		return true;
	}
	
	public function save($post, $valid = true)
	{
		if($valid === true && !$this->valid($post)) {
			return false;
		}
 
		if(!$post->id) {
			$model = new OrderPrintContentModel();
			
		}else{
			$model = OrderPrintContentModel::find()->where(['id' => $post->id])->one();
		}
		//var_dump($model);die;
		//if($post->pid && $post->cid){
		$model->pid = intval($post->pid);
		$model->cid =intval($post->cid); 	
		//}
		$model->content = $post->content;
		$model->p_sort  = 0;
		$model->status  = 1;
		
		if(!$model->save()) {
			$this->errors = $model->errors;
			return false;
		}
		return true;
		
	}
	public function formData($post = null)
	{
		//var_dump($post);
		if($post->id){
			$oInfo = OrderPrintContentModel::find()->select('id,pid,cid,content,status,p_sort')
				->where(['id' => $post->id]);	
				$oInfo = $oInfo->asArray()->one();
				
		}else{
			$oInfo = OrderPrintContentModel::find()->select('content')
				->where(['pid' => $post->pid]);
				$oInfo = $oInfo->asArray()->all();
				
		}
		//var_dump($oInfo->createCommand()->getRawSql());die;
		return $oInfo;
	}
}
