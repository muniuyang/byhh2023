<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace mobile\widgets\df_byhhmcate;

use Yii;

use common\models\GcategoryModel;

use common\widgets\BaseWidget;

/**
 * @Id main.widget.php 2018.9.13 $
 * @author mosir
 */
 
class Df_byhhmcateWidget extends BaseWidget
{
    var $name = 'df_byhhmcate';

    public function getData()
    {
        $post = \common\library\Basewind::trimAll(Yii::$app->request->get(), true);
        //var_dump($post->cid);
        $list = GcategoryModel::find()->select('cate_id, cate_name')
            ->where(['if_show' => 1, 'parent_id' => 0])
            ->orderBy(['sort_order' => SORT_ASC, 'cate_id' => SORT_ASC])
            ->limit(6)->asArray()->all();
        
        
        return array_merge(['list' => $list], $this->options);
    }

    public function parseConfig($input)
    {
        return $input;
    }   
}