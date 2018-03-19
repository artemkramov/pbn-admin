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
 * @property integer $isDeleted
 * @property integer $websiteID
 *
 * @property Website $website
 */
class MenuType extends BeanWebsite
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%menu-type}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'alias'], 'required'],
            [['isDeleted', 'websiteID'], 'integer'],
            [['name', 'alias'], 'string', 'max' => 255],
            [['websiteID'], 'exist', 'skipOnError' => true, 'targetClass' => Website::className(), 'targetAttribute' => ['websiteID' => 'id']],
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
            'singular' => 'Menu type',
            'multiple' => 'Menu types'
        ];
    }


    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWebsite()
    {
        return $this->hasOne(Website::className(), ['id' => 'websiteID']);
    }
}
