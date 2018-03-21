<?php

namespace backend\models;

use common\models\BeanWebsite;
use Yii;

/**
 * This is the model class for table "page-type".
 *
 * @property integer $id
 * @property string $alias
 * @property string $routeID
 * @property integer $pageID
 *
 * @property Page $page
 * @property Route $route
 */
class PageRoute extends BeanWebsite
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%page-route}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pageID', 'alias', 'routeID'], 'required'],
            [['pageID', 'routeID'], 'integer'],
            [['alias'], 'string'],
            [['pageID'], 'exist', 'skipOnError' => true, 'targetClass' => Page::className(), 'targetAttribute' => ['pageID' => 'id']],
            [['routeID'], 'exist', 'skipOnError' => true, 'targetClass' => Route::className(), 'targetAttribute' => ['routeID' => 'id']]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'      => 'ID',
            'alias'   => 'Alias',
            'routeID' => 'Route',
            'pageID'  => 'Page'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPage()
    {
        return $this->hasOne(Page::className(), ['id' => 'pageID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoute()
    {
        return $this->hasOne(Route::className(), ['id' => 'routeID']);
    }

}
