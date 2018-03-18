<?php

namespace backend\models;

use common\models\BeanWebsite;
use Yii;

/**
 * This is the model class for table "template".
 *
 * @property integer $id
 * @property string $name
 * @property string $alias
 * @property string $type
 * @property integer $isDeleted
 * @property integer $websiteID
 *
 * @property Website $website
 */
class Template extends BeanWebsite
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'template';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'alias', 'type', 'websiteID'], 'required'],
            [['isDeleted', 'websiteID'], 'integer'],
            [['name', 'alias', 'type'], 'string', 'max' => 255],
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
            'type'      => 'Type',
            'isDeleted' => 'Is deleted',
            'websiteID' => 'Website',
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
     * Method for getting the name of the bean
     * Is called for breadcrumb generation
     * @return array
     */
    public static function getLabels()
    {
        return [
            'singular' => 'Template',
            'multiple' => 'Templates'
        ];
    }

    /**
     * @return array
     */
    public static function listType()
    {
        return [
            'inner'   => 'inner',
            'carcass' => 'carcass'
        ];
    }
}
