<?php

namespace backend\models;

use common\models\BeanWebsite;
use Yii;

/**
 * This is the model class for table "route".
 *
 * @property integer $id
 * @property string $name
 * @property string $link
 * @property integer $priority
 * @property integer $isDeleted
 * @property integer $websiteID
 *
 * @property Website $website
 */
class Route extends BeanWebsite
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'route';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'link', 'priority'], 'required'],
            [['priority', 'isDeleted', 'websiteID'], 'integer'],
            [['name', 'link'], 'string', 'max' => 255],
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
            'link'      => 'Link',
            'priority'  => 'Priority',
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
            'singular' => 'Route',
            'multiple' => 'Routes'
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
