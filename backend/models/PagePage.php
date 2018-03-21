<?php

namespace backend\models;

use common\models\BeanWebsite;
use Yii;

/**
 * This is the model class for table "page-type".
 *
 * @property integer $id
 * @property string $pageParentID
 * @property string $pageChildID
 *
 * @property Page $pageChild
 * @property Page $pageParent
 */
class PagePage extends BeanWebsite
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%page-page}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pageParentID', 'pageChildID'], 'required'],
            [['pageParentID', 'pageChildID'], 'integer'],
            [['pageParentID'], 'exist', 'skipOnError' => true, 'targetClass' => Page::className(), 'targetAttribute' => ['pageParentID' => 'id']],
            [['pageChildID'], 'exist', 'skipOnError' => true, 'targetClass' => Page::className(), 'targetAttribute' => ['pageChildID' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'           => 'ID',
            'pageParentID' => 'Parent page',
            'pageChildID'  => 'Child page'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPageParent()
    {
        return $this->hasOne(Page::className(), ['id' => 'pageParentID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPageChild()
    {
        return $this->hasOne(Page::className(), ['id' => 'pageChildID']);
    }
}
