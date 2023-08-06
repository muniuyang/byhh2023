<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace apiserver\controllers;

use Yii;
use yii\web\Controller;

use common\models\ArticleModel;
use common\models\AcategoryModel;

use common\library\Basewind;
use common\library\Timezone;
use common\library\Page;

use apiserver\library\Respond;

/**
 * @Id ArticleController.php 2018.10.15 $
 * @author yxyc
 */

class ArticleController extends Controller
{
	public $layout = false; 
	public $enableCsrfValidation = false;
	
	public $params;

	/**
	 * 获取文章详情
	 * @api 接口访问地址: http://api.xxx.com/article/list
	 */
    public function actionList()
    {
		// 验证签名
		$respond = new Respond();
		if(!$respond->verify(false)) {
			return $respond->output(false);
		}
		
		// 业务参数
		$post = Basewind::trimAll($respond->getParams(), true, ['cate_id', 'page', 'page_size']);
		
		$query = ArticleModel::find()->select('article_id, title, add_time')
			->where(['if_show' => 1])
			->orderBy(['sort_order' => SORT_ASC, 'article_id' => SORT_DESC]);

		if($post->cate_id) {
			$allId = AcategoryModel::getDescendantIds($post->cate_id);
			$query->andWhere(['in', 'cate_id', $allId]);
		}

		if(isset($post->items) && !empty($post->items)) {
			$query->andWhere(['in', 'article_id', explode(',', $post->items)]);
		}

		$page = Page::getPage($query->count(), $post->page_size, false, $post->page);
		$list = $query->offset($page->offset)->limit($page->limit)->asArray()->all();
		foreach($list as $key => $value) {
			$list[$key]['add_time'] = Timezone::localDate('Y-m-d', $value['add_time']);
		}
	
		return $respond->output(true, null, ['list' => $list, 'pagination' => Page::formatPage($page, false)]);
    }
	
	/**
	 * 获取文章详情
	 * @api 接口访问地址: http://api.xxx.com/article/read
	 */
    public function actionRead()
    {
		// 验证签名
		$respond = new Respond();
		if(!$respond->verify(false)) {
			return $respond->output(false);
		}
		
		// 业务参数
		$post = Basewind::trimAll($respond->getParams(), true, ['id']);
		
		$record = ArticleModel::find()->select('article_id, title, description, add_time')->where(['article_id' => $post->id, 'if_show' => 1])->asArray()->one();
		$record['add_time'] = Timezone::localDate('Y-m-d', $record['add_time']);
	
		return $respond->output(true, null, $record);
    }
}