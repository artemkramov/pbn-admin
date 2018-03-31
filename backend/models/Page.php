<?php

namespace backend\models;

use common\components\MultilingualBehavior;
use common\models\BeanWebsite;
use common\models\Lang;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "page".
 *
 * @property integer $id
 * @property string $image1
 * @property string $image2
 * @property string $image3
 * @property string $datePublished
 * @property string $dateCreated
 * @property string $dateModified
 * @property integer $sort
 * @property integer $authorID
 * @property string $seoPriority
 * @property integer $pageTypeID
 * @property integer $ratingValue
 * @property integer $ratingCount
 * @property integer $isPaginationOn
 * @property integer $paginationID
 * @property integer $paginationPerPage
 * @property integer $showAllPosts
 * @property integer $templateCarcassID
 * @property integer $templateInnerID
 * @property integer $isSeoPage
 * @property integer $isVisibleSitemapXml
 * @property integer $isVisibleSitemapHtml
 * @property integer $isMainPage
 * @property integer $isEnabled
 * @property integer $isDeleted
 * @property integer $websiteID
 *
 * @property Menu[] $menus
 * @property Page $author
 * @property Page[] $pages
 * @property PageType $pageType
 * @property Pagination $pagination
 * @property Template $templateCarcass
 * @property Template $templateInner
 * @property Website $website
 * @property PagePage $parentItems
 * @property PageExtraMeta $metaItems
 * @property PageRoute $routes
 */
class Page extends BeanWebsite
{

    const STATUS_ENABLED = 1;
    const STATUS_NOT_ENABLED = 0;

    public $authorData = null;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'page';
    }

    /**
     * Url of the current post
     * @var string
     */
    private $url;

    /**
     * @var string
     */
    protected $tableLang = '{{%page-language}}';

    /**
     * @inheritdoc
     */
    public function rules()
    {
        $multiLanguageNames = $this->formMultiLanguageFields();
        $safe = ArrayHelper::merge($multiLanguageNames['title'], $multiLanguageNames['description'], $multiLanguageNames['descriptionShort'], $multiLanguageNames['seoTitle'], $multiLanguageNames['seoDescription'], $multiLanguageNames['seoKeywords']);
        return [
            [['datePublished', 'dateCreated', 'dateModified'], 'safe'],
            [['templateCarcassID', 'templateInnerID'], 'required'],
            [['sort', 'authorID', 'pageTypeID', 'showAllPosts', 'ratingValue', 'ratingCount', 'isSeoPage', 'isPaginationOn', 'paginationID', 'paginationPerPage', 'templateCarcassID', 'templateInnerID', 'isVisibleSitemapXml', 'isVisibleSitemapHtml', 'isMainPage', 'isEnabled', 'isDeleted', 'websiteID'], 'integer'],
            [['seoPriority'], 'number'],
            [['image1', 'image2', 'image3'], 'string', 'max' => 255],
            [['authorID'], 'exist', 'skipOnError' => true, 'targetClass' => Page::className(), 'targetAttribute' => ['authorID' => 'id']],
            [['pageTypeID'], 'exist', 'skipOnError' => true, 'targetClass' => PageType::className(), 'targetAttribute' => ['pageTypeID' => 'id']],
            [['paginationID'], 'exist', 'skipOnError' => true, 'targetClass' => Pagination::className(), 'targetAttribute' => ['paginationID' => 'id']],
            [['templateCarcassID'], 'exist', 'skipOnError' => true, 'targetClass' => Template::className(), 'targetAttribute' => ['templateCarcassID' => 'id']],
            [['templateInnerID'], 'exist', 'skipOnError' => true, 'targetClass' => Template::className(), 'targetAttribute' => ['templateInnerID' => 'id']],
            [['websiteID'], 'exist', 'skipOnError' => true, 'targetClass' => Website::className(), 'targetAttribute' => ['websiteID' => 'id']],
            [$safe, 'safe'],
            ['parentItems', 'validateRelatedBeans', 'skipOnEmpty' => false, 'skipOnError' => false, 'params' => ['beanRelatedField' => 'pageChildID', 'beanClass' => PagePage::className()]],
            ['metaItems', 'validateRelatedBeans', 'skipOnEmpty' => false, 'skipOnError' => false, 'params' => ['beanRelatedField' => 'pageID', 'beanClass' => PageExtraMeta::className()]],
            ['routes', 'validateRelatedBeans', 'skipOnEmpty' => false, 'skipOnError' => false, 'params' => ['beanRelatedField' => 'pageID', 'beanClass' => PageRoute::className()]],
        ];
    }

    /**
     * Init function
     */
    public function init()
    {
        $this->multiLanguageFields = ['title', 'description', 'descriptionShort', 'seoTitle', 'seoDescription', 'seoKeywords'];
        parent::init();
    }

    /**
     * @return array
     */
    public function behaviors()
    {
        return ArrayHelper::merge(parent::behaviors(), [
            'timestamp' => [
                'class'              => TimestampBehavior::className(),
                'createdAtAttribute' => 'dateCreated',
                'updatedAtAttribute' => 'dateModified',
                'value'              => new Expression('NOW()'),
            ],
            'ml'        => [
                'class'           => MultilingualBehavior::className(),
                'defaultLanguage' => Lang::getDefaultLang()->url,
                'langForeignKey'  => 'pageID',
                'tableName'       => $this->tableLang,
                'attributes'      => $this->multiLanguageFields,
            ]
        ]);
    }


    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'                   => 'ID',
            'image1'               => 'Image1',
            'image2'               => 'Image2',
            'image3'               => 'Image3',
            'datePublished'        => 'Date',
            'dateCreated'          => 'Date created',
            'dateModified'         => 'Date modified',
            'sort'                 => 'Sort',
            'authorID'             => 'Author',
            'seoPriority'          => 'Seo priority',
            'pageTypeID'           => 'Page type',
            'ratingValue'          => 'Rating value',
            'ratingCount'          => 'Rating count',
            'isPaginationOn'       => 'Is pagination on',
            'paginationID'         => 'Pagination',
            'paginationPerPage'    => 'Pagination per page',
            'showAllPosts'         => 'Show all posts',
            'templateCarcassID'    => 'Template carcass',
            'templateInnerID'      => 'Template inner',
            'isSeoPage'            => 'Is seo page',
            'isVisibleSitemapXml'  => 'Is visible sitemap XML',
            'isVisibleSitemapHtml' => 'Is visible sitemap HTML',
            'isMainPage'           => 'Is main page',
            'isEnabled'            => 'Is enabled',
            'isDeleted'            => 'Is deleted',
            'websiteID'            => 'Website'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['pageID' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuthor()
    {
        return $this->hasOne(Page::className(), ['id' => 'authorID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPages()
    {
        return $this->hasMany(Page::className(), ['authorID' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPageType()
    {
        return $this->hasOne(PageType::className(), ['id' => 'pageTypeID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPagination()
    {
        return $this->hasOne(Pagination::className(), ['id' => 'paginationID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTemplateCarcass()
    {
        return $this->hasOne(Template::className(), ['id' => 'templateCarcassID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTemplateInner()
    {
        return $this->hasOne(Template::className(), ['id' => 'templateInnerID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWebsite()
    {
        return $this->hasOne(Website::className(), ['id' => 'websiteID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParentItems()
    {
        return $this->hasMany(PagePage::className(), [
            'pageChildID' => 'id'
        ]);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMetaItems()
    {
        return $this->hasMany(PageExtraMeta::className(), [
            'pageID' => 'id'
        ]);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoutes()
    {
        return $this->hasMany(PageRoute::className(), [
            'pageID' => 'id'
        ]);
    }

    /**
     * @param $save
     * @param array $postData
     */
    public function setParentItems($postData, $save = false)
    {
        if (!$save) return;
        PagePage::deleteAll(['pageChildID' => $this->id]);
        $data = $this->bundleMultipleBean(PagePage::className(), $postData);
        foreach ($data['items'] as $bean) {
            /**
             * @var PagePage $bean
             */
            $bean->pageChildID = $this->id;
            $bean->save();
        }
    }

    /**
     * @param $save
     * @param array $postData
     */
    public function setMetaItems($postData, $save = false)
    {
        if (!$save) return;
        PageExtraMeta::deleteAll(['pageID' => $this->id]);
        $data = $this->bundleMultipleBean(PageExtraMeta::className(), $postData);
        foreach ($data['items'] as $bean) {
            /**
             * @var PageExtraMeta $bean
             */
            $bean->pageID = $this->id;
            $bean->save();
        }
    }

    /**
     * @param $save
     * @param array $postData
     */
    public function setRoutes($postData, $save = false)
    {
        if (!$save) return;
        PageRoute::deleteAll(['pageID' => $this->id]);
        $data = $this->bundleMultipleBean(PageRoute::className(), $postData);
        foreach ($data['items'] as $bean) {
            /**
             * @var PageRoute $bean
             */
            $bean->pageID = $this->id;
            $bean->save();
        }
    }

    /**
     * @param bool $insert
     * @param array $changedAttributes
     */
    public function afterSave($insert, $changedAttributes)
    {
        if ($this->scenario == self::SCENARIO_DEFAULT) {
            $postData = \Yii::$app->request->post();
            PagePage::deleteAll(['pageChildID' => $this->id]);
            if (array_key_exists('parentItems', $postData['Page'])) {
                $this->setParentItems($postData['Page']['parentItems'], true);
            }
            PageExtraMeta::deleteAll(['pageID' => $this->id]);
            if (array_key_exists('metaItems', $postData['Page'])) {
                $this->setMetaItems($postData['Page']['metaItems'], true);
            }
            if (array_key_exists('routes', $postData['Page'])) {
                $this->setRoutes($postData['Page']['routes'], true);
            }
        }
        parent::afterSave($insert, $changedAttributes);
    }

    /**
     * @return array|\yii\db\ActiveRecord[]
     */
    public static function findAllLocalized()
    {
        $query = self::find()->localized(Lang::getCurrent()->url)
            ->where([
                'isEnabled' => self::STATUS_ENABLED,
                'isDeleted' => self::STATUS_NOT_DELETED
            ]);
        $websiteID = Yii::$app->request->websiteID;
        if (isset($websiteID)) {
            $query->andWhere([
                'websiteID' => $websiteID
            ]);
        }
        return $query->all();
    }

    /**
     * @param string $id
     * @param string $field
     * @return array
     */
    public static function listAllLocalized($id = 'id', $field = 'title')
    {
        $response = [];
        $collection = self::findAllLocalized();
        foreach ($collection as $item) {
            $response[$item->{$id}] = $item->{$field};
        }
        return $response;
    }

    /**
     * Method for getting the name of the bean
     * Is called for breadcrumb generation
     * @param string $type
     * @return array
     */
    public static function getLabels($type = null)
    {
        $labels = [];
        switch ($type) {
            case 'post':
                $labels['singular'] = 'Post';
                $labels['multiple'] = 'Posts';
                break;
            case 'category':
                $labels['singular'] = 'Category';
                $labels['multiple'] = 'Categories';
                break;
            case 'author':
                $labels['singular'] = 'Author';
                $labels['multiple'] = 'Authors';
                break;
            default:
                $labels['singular'] = 'Page';
                $labels['multiple'] = 'Pages';
                break;
        }
        return $labels;
    }

    /**
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function getDefaultAuthor()
    {
        /**
         * @var PageType $pageType
         */
        $pageType = PageType::getPageTypeByAlias('author');
        return self::find()
            ->where([
                'pageTypeID' => $pageType->id,
                'websiteID'  => Yii::$app->request->websiteID,
                'isEnabled'  => self::STATUS_ENABLED,
                'isDeleted'  => self::STATUS_NOT_DELETED
            ])
            ->one();
    }

}
