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
 * @Id AddressServModel.php 2023.10.15 $
 * @author jcheng
 */

class AddressDeliveryModel extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%address_delivery}}';
    }
	 // 关联表
	 public function getAddressBook()
	 {
		return parent::hasOne(AddressBookModel::className(), ['book_id' => 'book_id']);
	 }
}
