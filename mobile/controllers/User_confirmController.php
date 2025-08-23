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
use yii\captcha\CaptchaValidator;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

use common\models\UserModel;
use common\models\StoreModel;
use common\models\IntegralSettingModel;
use common\models\DepositAccountModel;
use common\models\BindModel;
use common\models\FriendModel;

use common\library\Basewind;
use common\library\Language;
use common\library\Message;
use common\library\Resource;
use common\library\Timezone;
use common\library\Page;
use common\library\Def;
use common\library\Plugin;

/**
 * @Id User_confirmController.php 2025.8.10 $
 * @author jcheng
 */

class User_confirmController extends \common\controllers\BaseUserController
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
	}
	
	/**
	 * 排除特定Action外，其他需要登录后访问
	 * @param $action
	 * @var array $extraAction
	 */
	public function beforeAction($action)
    {
		$this->extraAction = ['index'];
		return parent::beforeAction($action);
    }

    public function actionIndex()
    {
    	if(in_array(Yii::$app->user->id,Yii::$app->params['createRights'])){//权限判断[START]JchengCustom
			return $this->redirect(['orderbyhh/index', 'from' => 'ucenter']);
		}
		 
		// 当前位置
		$this->params['_curlocal'] = Page::setLocal(Language::get('overview'));
		
		// 当前用户中心菜单
		$this->params['_usermenu'] = Page::setMenu('overview');
		$this->params['_foot_tags'] = Resource::import([
				'script' => 'jquery.ui/jquery.ui.js,jquery.ui/i18n/' . Yii::$app->language . '.js,jquery.plugins/jquery.validate.js,dialog/dialog.js,mlselection.js,user.js
				,jquery.plugins/jquery.form.js,inline_edit.js,jquery.plugins/timepicker/jquery-ui-timepicker-addon.js',
				'style' =>  'jquery.ui/themes/smoothness/jquery.ui.css,dialog/dialog.css,jquery.plugins/timepicker/jquery-ui-timepicker-addon.css'
			]);
		$this->params['page'] = Page::seo(['title' => Language::get('user_center')]);
        return $this->render('../user_confirm.index.html', $this->params);
    }

  
}