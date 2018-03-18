<?php

namespace backend\models;

use common\models\BeanWebsite;
use Yii;

/**
 * This is the model class for table "pagination".
 *
 * @property integer $id
 * @property string $template
 * @property integer $isDeleted
 * @property integer $websiteID
 *
 * @property Website $website
 */
class Pagination extends BeanWebsite
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pagination';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['template'], 'required'],
            [['isDeleted', 'websiteID'], 'integer'],
            [['template'], 'string', 'max' => 255],
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
            'template'  => 'Template',
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
            'singular' => 'Pagination',
            'multiple' => 'Pagination'
        ];
    }

}
