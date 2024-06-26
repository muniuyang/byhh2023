<?php

/**
 * @link https://www.shopwind.net/
 * @copyright Copyright (c) 2018 ShopWind Inc. All Rights Reserved.
 *
 * This is not free software. Do not use it for commercial purposes. 
 * If you need commercial operation, please contact us to purchase a license.
 * @license https://www.shopwind.net/license/
 */

namespace common\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * @Id GoodsHotsModel.php 2024.6.8 $
 * @author Jcheng
 */

class GoodsHotsModel extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%goods_hots}}';
    }
	
	// 关联表
	public function getGoods()
	{
		return parent::hasOne(GoodsModel::className(), ['goods_id' => 'goods_id']);
	}
}
