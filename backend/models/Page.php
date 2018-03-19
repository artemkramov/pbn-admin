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
 * @property integer $templateCarcassID
 * @property integer $templateInnerID
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
 * @property Page-type $pageType
 * @property Pagination $pagination
 * @property Template $templateCarcass
 * @property Template $templateInner
 * @property Website $website
 */
class Page extends BeanWebsite
{

    const STATUS_ENABLED = 1;
    const STATUS_NOT_ENABLED = 0;

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
            [['sort', 'authorID', 'pageTypeID', 'ratingValue', 'ratingCount', 'isPaginationOn', 'paginationID', 'paginationPerPage', 'templateCarcassID', 'templateInnerID', 'isVisibleSitemapXml', 'isVisibleSitemapHtml', 'isMainPage', 'isEnabled', 'isDeleted', 'websiteID'], 'integer'],
            [['seoPriority'], 'number'],
            [['image1', 'image2', 'image3'], 'string', 'max' => 255],
            [['authorID'], 'exist', 'skipOnError' => true, 'targetClass' => Page::className(), 'targetAttribute' => ['authorID' => 'id']],
            [['pageTypeID'], 'exist', 'skipOnError' => true, 'targetClass' => PageType::className(), 'targetAttribute' => ['pageTypeID' => 'id']],
            [['paginationID'], 'exist', 'skipOnError' => true, 'targetClass' => Pagination::className(), 'targetAttribute' => ['paginationID' => 'id']],
            [['templateCarcassID'], 'exist', 'skipOnError' => true, 'targetClass' => Template::className(), 'targetAttribute' => ['templateCarcassID' => 'id']],
            [['templateInnerID'], 'exist', 'skipOnError' => true, 'targetClass' => Template::className(), 'targetAttribute' => ['templateInnerID' => 'id']],
            [['websiteID'], 'exist', 'skipOnError' => true, 'targetClass' => Website::className(), 'targetAttribute' => ['websiteID' => 'id']],
            [$safe, 'safe']
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
            'datePublished'        => 'Date published',
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
            'templateCarcassID'    => 'Template carcass',
            'templateInnerID'      => 'Template inner',
            'isVisibleSitemapXml'  => 'Is visible sitemap XML',
            'isVisibleSitemapHtml' => 'Is visible sitemap HTML',
            'isMainPage'           => 'Is main page',
            'isEnabled'            => 'Is enabled',
            'isDeleted'            => 'Is deleted',
            'websiteID'            => 'Website',
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
     * @return array
     */
    public static function getLabels()
    {
        return [
            'singular' => 'Page',
            'multiple' => 'Pages'
        ];
    }

//    /**
//     * @return \yii\db\ActiveQuery
//     */
//    public function getPage-extra-metas()
//    {
//        return $this->hasMany(Page-extra-meta::className(), ['pageID' => 'id']);
//    }
//
//
//    /**
//     * @return \yii\db\ActiveQuery
//     */
//    public function getPage-routes()
//    {
//        return $this->hasMany(Page-route::className(), ['pageID' => 'id']);
//    }
}
