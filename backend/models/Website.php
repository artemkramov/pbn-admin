<?php

namespace backend\models;

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
class Website extends \yii\db\ActiveRecord
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
            'id' => 'ID',
            'url' => 'Url',
            'dsn' => 'Dsn',
            'username' => 'Username',
            'password' => 'Password',
            'isRemoteConnection' => 'Is Remote Connection',
        ];
    }
}
