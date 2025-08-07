<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace mobile\widgets\df_goodsappoint;

use Yii;

use common\models\LimitbuyModel;

use common\library\Basewind;
use common\library\Timezone;
use common\library\Promotool;

use common\widgets\BaseWidget;

/**
 * @Id main.widget.php 2018.9.13 $
 * @author mosir
 */

class Df_goodsappointWidget extends BaseWidget
{
    var $name = 'df_goodsappoint';

    public function getData()
    {
        $query = LimitbuyModel::find()->alias('lb')->select('g.goods_id,g.goods_name,g.default_image,g.price,g.default_spec as spec_id')
            ->joinWith('goods g', false, 'INNER JOIN')
            ->joinWith('store s', false)
         //   ->where(['and', ['s.state' => 1, 'g.if_show' => 1, 'g.closed' => 0]])
            ->orderBy(['id' => SORT_DESC]);

        if($this->options['source'] == 'choice') {
            $query->andWhere(['in', 'g.goods_id', explode(',', $this->options['items'])]);
        } else {
            $query->limit($this->options['quantity'] > 0 ? $this->options['quantity'] : 3);
        }
        //echo $query->createCommand()->getRawSql();

      

        
        if(empty($list = $query->asArray()->all())) {
            $list = array([],[],[]);
        }

        $promotool = Promotool::getInstance()->build();
		foreach($list as $key => $value) {
			$list[$key]['promotion'] = $promotool->getItemProInfo($value['goods_id'], $value['spec_id']);
		}
        
        $phpself = htmlentities(isset($_SERVER['PHP_SELF']) ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME']);
        $selfurl =  Yii::$app->request->hostInfo . substr($phpself, 0, strrpos($phpself, '/'));


        $url =  isset(Yii::$app->params['frontendUrl']) ? Yii::$app->params['frontendUrl'] :  $selfurl;
var_dump($list); 
        return array_merge(['list' => empty($list) ? [] : $list, 'baseUrl'=>$url,'baseUrl2' => Basewind::mobileUrl()], $this->options);
        //return array_merge(['list' => $list, 'baseUrl' => Basewind::mobileUrl()], $this->options);
    }

    public function parseConfig($input)
    {
         var_dump($input);die;
        return $input;
    }   
}
