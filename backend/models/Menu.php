<?php

namespace backend\models;

use backend\components\SiteHelper;
use common\components\MultilingualBehavior;
use common\models\BeanWebsite;
use common\models\Lang;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id
 * @property string $dateCreated
 * @property string $dateModified
 * @property integer $sort
 * @property integer $parentID
 * @property integer $pageID
 * @property string $image
 * @property string $url
 * @property integer $menuTypeID
 * @property integer $isEnabled
 * @property integer $isDirect
 * @property integer $isNewTab
 * @property integer $isDeleted
 * @property integer $websiteID
 *
 * @property Menu $parent
 * @property Menu[] $menus
 * @property Page $page
 * @property MenuType $menuType
 * @property Website $website
 */
class Menu extends BeanWebsite
{

    const SCENARIO_SORT = 'sort';

    const STATUS_ENABLED = 1;
    const STATUS_NOT_ENABLED = 0;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'menu';
    }

    /**
     * @var string
     */
    protected $tableLang = '{{%menu-language}}';

    /**
     * Check if the url is manually entered
     * @var bool
     */
    public $isCustomUrl = false;

    /**
     * Initialize multilingual fields
     */
    public function init()
    {
        $this->multiLanguageFields = ['title'];
        parent::init();
    }

    /**
     * Behaviors of the model
     * @return array
     */
    public function behaviors()
    {
        return ArrayHelper::merge(parent::behaviors(), [
            [
                'class'              => TimestampBehavior::className(),
                'createdAtAttribute' => 'dateCreated',
                'updatedAtAttribute' => 'dateModified',
                'value'              => new Expression('NOW()'),
            ],
            'ml' => [
                'class'           => MultilingualBehavior::className(),
                'defaultLanguage' => Lang::getDefaultLang()->url,
                'langForeignKey'  => 'menuID',
                'tableName'       => $this->tableLang,
                'attributes'      => $this->multiLanguageFields,
            ]
        ]);
    }

    public function scenarios()
    {
        return ArrayHelper::merge(parent::scenarios(), [
            self::SCENARIO_SORT => ['sort'],
        ]);
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        $multiLanguageNames = $this->formMultiLanguageFields();
        $safe = $multiLanguageNames['title'];
        return [
            [['dateCreated', 'dateModified'], 'safe'],
            [['sort', 'parentID', 'pageID', 'menuTypeID', 'isEnabled', 'isDirect', 'isNewTab', 'isDeleted', 'websiteID'], 'integer'],
            [['menuTypeID'], 'required'],
            [['image', 'url'], 'string', 'max' => 255],
            [['parentID'], 'exist', 'skipOnError' => true, 'targetClass' => Menu::className(), 'targetAttribute' => ['parentID' => 'id']],
            [['pageID'], 'exist', 'skipOnError' => true, 'targetClass' => Page::className(), 'targetAttribute' => ['pageID' => 'id']],
            [['menuTypeID'], 'exist', 'skipOnError' => true, 'targetClass' => MenuType::className(), 'targetAttribute' => ['menuTypeID' => 'id']],
            [['websiteID'], 'exist', 'skipOnError' => true, 'targetClass' => Website::className(), 'targetAttribute' => ['websiteID' => 'id']],
            [$safe, 'safe']
        ];
    }

    /**
     * After find event
     */
    public function afterFind()
    {
        parent::afterFind();
        if (isset($this->url)) {
            $this->isCustomUrl = true;
        }
    }

    /**
     * Before save event
     * @param bool $insert
     * @return bool
     */
    public function beforeSave($insert)
    {
        if (!$this->isCustomUrl) {
            $this->url = null;
        }
        return parent::beforeSave($insert);
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'           => 'ID',
            'dateCreated'  => 'Date created',
            'dateModified' => 'Date modified',
            'sort'         => 'Sort',
            'parentID'     => 'Parent',
            'pageID'       => 'Page',
            'image'        => 'Image',
            'url'          => 'Url',
            'menuTypeID'   => 'Menu type',
            'isEnabled'    => 'Enabled',
            'isDirect'     => 'Is direct link',
            'isNewTab'     => 'Is new tab',
            'isDeleted'    => 'Is deleted',
            'isCustomUrl'  => 'Is custom url',
            'websiteID'    => 'Website',
            'title'        => 'Title'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParent()
    {
        return $this->hasOne(Menu::className(), ['id' => 'parentID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['parentID' => 'id']);
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
    public function getMenuType()
    {
        return $this->hasOne(MenuType::className(), ['id' => 'menuTypeID']);
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
            'singular' => 'Menu',
            'multiple' => 'Menu'
        ];
    }

    /**
     * @param int $excludeID
     * @param $type
     * @return array
     */
    public static function findAllWithTitle($excludeID, $type = null)
    {
        $query = self::find()->localized(Lang::getCurrent()->url);
        if (isset($excludeID)) {
            $query = $query->where(['!=', 'id', $excludeID])
                ->andWhere([
                    'isDeleted' => self::STATUS_NOT_DELETED,
                    'isEnabled' => self::STATUS_ENABLED
                ]);
        }
        if (isset($type)) {
            $query = $query->andWhere([
                'menuTypeID' => $type
            ]);
        }
        return $query->orderBy('sort')->all();
    }

    /**
     * @param int $excludeID
     * @param $menuTypeID
     * @return array
     */
    public static function getMenuDropdown($excludeID, $menuTypeID = null)
    {
        $menuCollection = Menu::findAllWithTitle($excludeID, $menuTypeID);
        $menuTree = SiteHelper::buildTreeArrayFromCollection($menuCollection, 'id');
        return SiteHelper::buildTreeDropdown($menuTree, 'id', 'title');
    }

    /**
     * Save the menu structure based on the JSON string
     * @param string $jsonTree
     */
    public static function saveMenuTree($jsonTree)
    {
        $collection = json_decode($jsonTree);
        if (is_array($collection)) {
            self::saveTree($collection);
        }
    }

    /**
     * Save menu data by the given collection
     * @param array $collection
     * @param null|integer $parentID
     */
    public static function saveTree($collection, $parentID = null)
    {
        foreach ($collection as $key => $item) {
            /**
             * @var self $menuItem
             */
            $menuItem = self::findOne($item->id);
            $menuItem->setScenario(self::SCENARIO_SORT);
            $menuItem->sort = $key;
            $menuItem->parentID = $parentID;
            $menuItem->save();
            if (isset($item->children) && !empty($item->children)) {
                self::saveTree($item->children, $item->id);
            }
        }
    }

}
