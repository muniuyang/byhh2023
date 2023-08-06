<?php

namespace devanych\cart\storage;

use devanych\cart\CartItem;
use yii\db\Query;
use Yii;

class DbSessionStorage implements StorageInterface
{
    /**
     * @var string $string Table name
     */
    private $table = '{{%cart}}';

    /**
     * @var array $params Custom configuration params
     */
    private $params;

    /**
     * @var \yii\db\Connection $db
     */
    private $db;

    /**
     * @var integer $userId
     */
    private $userId;

    /**
     * @var SessionStorage $sessionStorage
     */
    private $sessionStorage;

    public function __construct(array $params)
    {
        $this->params = $params;
        $this->db = Yii::$app->db;
        $this->userId = Yii::$app->user->id;
        $this->sessionStorage = new SessionStorage($this->params);
    }

    /**
     * @return CartItem[]
     */
    public function load()
    {
        if (Yii::$app->user->isGuest) {
            return $this->sessionStorage->load();
        }
        $this->moveItems();
        return $this->loadDb();
    }

    /**
     * @param CartItem[] $items
     * @return void
     */
    public function save(array $items)
    {
        if (Yii::$app->user->isGuest) {
            $this->sessionStorage->save($items);
        } else {
            $this->moveItems();
            $this->saveDb($items);
        }
    }

    /**
     *  Moves all items from session storage to database storage
     * @return void
     */
    private function moveItems()
    {
        if ($sessionItems = $this->sessionStorage->load()) {
            $items = array_merge($this->loadDb(), $sessionItems);
            $this->saveDb($items);
            $this->sessionStorage->save([]);
        }
    }

    /**
     * Load all items from the database
     * @return CartItem[]
     */
    private function loadDb()
    {
        $rows = (new Query())
            ->select('*')
            ->from($this->table)
            ->where(['userid' => $this->userId])
            ->all();

        $items = [];
        foreach ($rows as $row) {
			$model = $this->params['productClass'];
            $product = $model::find()
                ->where([$this->params['productFieldId'] => $row[$this->params['productFieldId']]])
                ->limit(1)
                ->one();
            if ($product) {
                $items[$product->{$this->params['productFieldId']}] = new CartItem($product, $row['quantity'], $this->params);
            }
        }
        return $items;
    }

    /**
     * Save all items to the database
     * @param CartItem[] $items
     * @return void
     */
    private function saveDb(array $items)
    {
        $this->db->createCommand()->delete($this->table, ['userid' => $this->userId])->execute();

        $this->db->createCommand()->batchInsert(
            $this->table,
            ['userid', 'spec_id', 'quantity'],
            array_map(function (CartItem $item) {
                return [
                    'userid' => $this->userId,
                    'spec_id' => $item->getId(),
                    'quantity' => $item->getQuantity(),
                ];
            }, $items)
        )->execute();
		
			
			print_r($items);exit;
		
		$model = new \common\models\CartModel;
		foreach($items as $attributes)
		{
			 $_model = clone $model;
			 $_model->setAttributes($attributes);
			 $_model->save();
		}
		
	}
}
