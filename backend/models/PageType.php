<?php

namespace backend\models;

use common\models\BeanWebsite;
use Yii;

/**
 * This is the model class for table "page-type".
 *
 * @property integer $id
 * @property string $name
 * @property string $alias
 * @property integer $routeID
 * @property integer $isDeleted
 * @property integer $websiteID
 *
 * @property Website $website
 */
class PageType extends BeanWebsite
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%page-type}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'alias', 'routeID'], 'required'],
            [['isDeleted', 'websiteID', 'routeID'], 'integer'],
            [['name', 'alias'], 'string', 'max' => 255],
            [['websiteID'], 'exist', 'skipOnError' => true, 'targetClass' => Website::className(), 'targetAttribute' => ['websiteID' => 'id']],
            [['routeID'], 'exist', 'skipOnError' => true, 'targetClass' => Route::className(), 'targetAttribute' => ['routeID' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'        => 'ID',
            'name'      => 'Name',
            'alias'     => 'Alias',
            'isDeleted' => 'Is deleted',
            'routeID'   => 'Route',
            'websiteID' => 'Website',
        ];
    }

    /**
     * Method for getting the name of the bean
     * Is called for breadcrumb generation
     * @return array
     */
    public static function getLabels()
    {
        return [
            'singular' => 'Page type',
            'multiple' => 'Page types'
        ];
    }


    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWebsite()
    {
        return $this->hasOne(Website::className(), ['id' => 'websiteID']);
    }

    /**
     * @param $alias
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function getPageTypeByAlias($alias)
    {
        return self::find()->where([
            'websiteID' => \Yii::$app->request->websiteID,
            'alias'     => $alias,
            'isDeleted' => self::STATUS_NOT_DELETED
        ])->one();
    }
}
