<?php

namespace common\models;
use yii\helpers\ArrayHelper;

/**
 * Class BeanWebsite
 * Bean for client websites
 * @package common\models
 */
class BeanWebsite extends Bean
{

    const STATUS_DELETED = 1;
    const STATUS_NOT_DELETED = 0;

    const SCENARIO_DELETE = 'delete';

    /**
     * Redefine the database connection
     * @return null|object
     */
    public static function getDb()
    {
        return \Yii::$app->get('db2');
    }

    /**
     * @return array
     */
    public function scenarios()
    {
        $scenarios = parent::scenarios();
        $scenarios[self::SCENARIO_DELETE] = ['isDeleted'];
        return $scenarios;
    }

    /**
     * Method for forming of dropdown list to the form
     * @param string $keyField
     * @param string $valueField
     * @param bool $asArray
     * @return mixed
     */
    public static function listAll($keyField = 'id', $valueField = 'name', $asArray = true)
    {
        $query = static::find()->where([
            'isDeleted' => self::STATUS_NOT_DELETED,
        ]);
        $websiteID = \Yii::$app->request->websiteID;
        if (isset($websiteID)) {
            $query->andWhere([
                'websiteID' => $websiteID
            ]);
        }
        if ($asArray) {
            $query->select([$keyField, $valueField])->asArray();
        }
        return ArrayHelper::map($query->all(), $keyField, $valueField);
    }

}