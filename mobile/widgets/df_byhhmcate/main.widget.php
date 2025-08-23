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
        $post = \common\library\Basewind::trimAll(Yii::$app->request->get(), false);
         $query = GcategoryModel::find()->select('cate_id, cate_name')
            ->where(['if_show' => 1])
            ->orderBy([ 'cate_id' => SORT_ASC]);
         if($this->options['source'] == 'choice') {
            $query->andWhere(['in', 'cate_id', explode(',', $this->options['items'])]);
        } else {
            $query->limit($this->options['quantity'] > 0 ? $this->options['quantity'] : 3);
        }
        if(empty($list = $query->asArray()->all())) {
            $list = array([],[],[]);
        }
     // echo $query->createCommand()->getRawSql();
        $this->options = array_merge($this->options,$post);
        //var_dump($this->options);
        return array_merge(['list' => $list], $this->options);
    }

    public function parseConfig($input)
    {
        return $input;
    }   
}