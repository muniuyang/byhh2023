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
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\captcha\CaptchaValidator;

use common\models\UserModel;
use common\models\GoodsModel;
use common\models\GoodsQaModel;
use common\models\GoodsPropModel;
use common\models\GoodsPvsModel;
use common\models\GoodsPropValueModel;
use common\models\GoodsStatisticsModel;
use common\models\OrderGoodsModel;
use common\models\GcategoryModel;
use common\models\StoreModel;
use common\models\RegionModel;
use common\models\IntegralSettingModel;
use common\models\MealGoodsModel;
use common\models\NavigationModel;

use common\library\Basewind;
use common\library\Language;
use common\library\Message;
use common\library\Resource;
use common\library\Timezone;
use common\library\Page;
use common\library\Def;
use common\library\Promotool;
/**
 * @Id DetailController.php 2025.08.05 $
 * @author mosir
 */

class ListController extends \common\controllers\BaseMallController
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
		$this->params = ArrayHelper::merge($this->params, Page::getAssign('mall'));
	}

    public function actionIndex()
    {
		$this->params['index'] = true;
					
 		$this->params['page'] = Page::seo();
 
        return $this->render('../list.html', $this->params);
    }

}