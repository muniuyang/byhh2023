<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace mobile\widgets\df_byhhnotice;

use Yii;

use common\models\ArticleModel;
use common\models\AcategoryModel;

use common\library\Basewind;
use common\widgets\BaseWidget;

/**
 * @Id main.widget.php 2018.9.13 $
 * @author mosir  
 */

class Df_byhhnoticeWidget extends BaseWidget
{
    var $name = 'df_byhhnotice';

    public function getData()
    {
        $query = ArticleModel::find()->select('article_id,title');
       
        if($this->options['source'] == 'choice') {
            $query->andWhere(['in', 'article_id', explode(',', $this->options['items'])]);
        } else {
            if($this->options['source'] == 'category') {
                $query->andWhere(['cate_id' => $this->options['cate_id']]);
            }
            $query->limit($this->options['quantity'] > 0 ? $this->options['quantity'] : 2);
        }
        $list = $query->orderBy(['article_id' => SORT_DESC])->asArray()->all();


        $phpself = htmlentities(isset($_SERVER['PHP_SELF']) ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME']);
        $selfurl =  Yii::$app->request->hostInfo . substr($phpself, 0, strrpos($phpself, '/'));


        $url =  isset(Yii::$app->params['frontendUrl']) ? Yii::$app->params['frontendUrl'] :  $selfurl;

        return array_merge(['list' => empty($list) ? [] : $list, 'baseUrl'=>$url,'baseUrl2' => Basewind::mobileUrl()], $this->options);
    }

    public function parseConfig($input)
    {
        return $input;
    }   
}
