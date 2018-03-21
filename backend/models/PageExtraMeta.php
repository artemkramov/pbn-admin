<?php

namespace backend\models;

use common\models\BeanWebsite;
use Yii;

/**
 * This is the model class for table "page-type".
 *
 * @property integer $id
 * @property string $name
 * @property string $content
 * @property integer $pageID
 *
 * @property Page $page
 */
class PageExtraMeta extends BeanWebsite
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%page-extra-meta}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pageID', 'name', 'content'], 'required'],
            [['pageID'], 'integer'],
            [['name', 'content'], 'string'],
            [['pageID'], 'exist', 'skipOnError' => true, 'targetClass' => Page::className(), 'targetAttribute' => ['pageID' => 'id']]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'      => 'ID',
            'name'    => 'Name',
            'content' => 'Content',
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
}
