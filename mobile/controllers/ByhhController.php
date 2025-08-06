<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace mobile\controllers;

use Yii;
//use yii\web\Response;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

use common\models\GoodsModel;
use common\models\GcategoryModel;

 
use common\library\Resource;
use common\library\Page;
use common\library\Weixin;
/**
 * @Id ByhhController.php 2025.08.04 $
 * @author mosir
 */

class ByhhController extends \common\controllers\BaseMallController
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
        $this->params = ArrayHelper::merge($this->params, [
             
        ]);
	}

    public function actionIndex()
    {

		$this->params['page'] = Page::seo();
		$this->params['page']['title']='博艺花卉内部订购平台';

        return $this->render('../byhh.index.html', $this->params);
    }
  
}