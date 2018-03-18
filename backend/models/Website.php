<?php

namespace backend\models;

use common\models\Bean;
use Yii;

/**
 * This is the model class for table "website".
 *
 * @property integer $id
 * @property string $url
 * @property string $dsn
 * @property string $username
 * @property string $password
 * @property integer $isRemoteConnection
 */
class Website extends Bean
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'website';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['url', 'isRemoteConnection'], 'required'],
            [['url', 'dsn', 'password'], 'string'],
            [['isRemoteConnection'], 'integer'],
            [['username'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'                 => 'ID',
            'url'                => 'URL',
            'dsn'                => 'DSN',
            'username'           => 'Username',
            'password'           => 'Password',
            'isRemoteConnection' => 'Is remote connection',
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
            'singular' => 'Website',
            'multiple' => 'Websites'
        ];
    }
}
