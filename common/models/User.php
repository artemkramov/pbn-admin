<?php
namespace common\models;

use backend\models\Customer;
use backend\models\Product;
use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\db\Query;
use yii\web\IdentityInterface;
use yii\helpers\BaseFileHelper;
use yii\imagine\Image;
use developeruz\db_rbac\interfaces\UserRbacInterface;
use backend\models\Employee;

/**
 * User model
 *
 * @property integer $id
 * @property string $username
 * @property string $passwordHash
 * @property string $passwordResetToken
 * @property string $email
 * @property string $authKey
 * @property integer $status
 * @property integer $dateCreated
 * @property integer $dateUpdated
 * @property string $password write-only password
 * @property string $logo
 *
 */
class User extends Bean implements IdentityInterface, UserRbacInterface
{
    const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 10;
    const ROLE_ADMIN = "admin";

    public $newPassword;
    public $newPasswordRepeat;

    /**
     * @return bool
     */
    public static function isAdmin()
    {
        $currentUser = \Yii::$app->user;
        $roles = \Yii::$app->authManager->getRolesByUser($currentUser->id);
        return array_key_exists(self::ROLE_ADMIN, $roles);
    }

    /**
     * Method for getting the name of the bean
     * Is called for breadcrumb generation
     * @return array
     */
    public static function getLabels()
    {
        return [
            'singular' => 'User',
            'multiple' => 'Users'
        ];
    }

    /**
     * Method for getting of the current user's logo
     * @return string
     */
    public static function getUserLogoPath()
    {
        return !empty(\Yii::$app->user->identity->logo) ? \Yii::$app->user->identity->logo : \Yii::$app->params['noImageSrc'];
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'passwordResetToken' => $token,
            'status'             => self::STATUS_ACTIVE,
        ]);
    }

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return boolean
     */
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }

        $timestamp = (int)substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();
    }

    /**
     * Returns user list by role name
     * @param $roleSlug
     * @return array|\yii\db\ActiveRecord[]
     */
    public static function findByRole($roleSlug)
    {
        return static::find()
            ->join('LEFT JOIN', 'auth-assignment', 'auth-assignment.user_id = id')
            ->where(['auth-assignment.item_name' => $roleSlug])
            ->all();
    }

    public function getOriginalTableName()
    {
        return \Yii::$app->db->tablePrefix . str_replace(array('{{', '}}', '%'), '', $this->tableName());
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user}}';
    }

    /**
     * @return array
     */
    public function scenarios()
    {
        return [
            parent::SCENARIO_DEFAULT => ['username', 'email', 'newPassword', 'newPasswordRepeat', 'status'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
                'class'              => TimestampBehavior::className(),
                'createdAtAttribute' => 'dateCreated',
                'updatedAtAttribute' => 'dateUpdated'
            ]
        ];
    }

    public function getUserName()
    {
        return $this->username;
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['status', 'default', 'value' => self::STATUS_ACTIVE],
            ['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_DELETED]],
            [['username', 'email'], 'required'],
            [['username', 'email'], 'unique'],
            ['email', 'email'],
            ['newPassword', 'string', 'length' => [6]],
            ['newPasswordRepeat', 'compare', 'compareAttribute' => 'newPassword', 'skipOnEmpty' => false],
            ['newPassword', 'required', 'when' => function ($model) {
                return (bool)($model->isNewRecord);
            }],
            ['logo', 'safe'],
        ];
    }

    /**
     * @param bool $insert
     * @return bool
     */
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if (!empty($this->newPassword)) {
                $this->setPassword($this->newPassword);
                $this->newPassword = "";
            }
            return true;
        }
        return false;
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->passwordHash = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * @param bool $insert
     * @param array $changedAttributes
     */
    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        if ($this->scenario == parent::SCENARIO_DEFAULT) {
            $this->assignRoles($this->id);
        }
    }

    /**
     * @param $userID
     */
    private function assignRoles($userID)
    {
        \Yii::$app->authManager->revokeAll($userID);
        if (\Yii::$app->request->post('roles')) {
            foreach (\Yii::$app->request->post('roles') as $role) {
                if (!empty($role)) {
                    $newRole = \Yii::$app->authManager->getRole($role);
                    \Yii::$app->authManager->assign($newRole, $userID);
                }
            }
        }
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->passwordHash);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->authKey = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->passwordResetToken = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->passwordResetToken = null;
    }
}
