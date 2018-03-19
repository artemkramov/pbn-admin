<?php

namespace backend\models\search;

use backend\models\PageType;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Page;

/**
 * PageSearch represents the model behind the search form about `backend\models\Page`.
 */
class PageSearch extends Page implements IContentSearch
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sort', 'authorID', 'pageTypeID', 'ratingValue', 'ratingCount', 'isPaginationOn', 'paginationID', 'paginationPerPage', 'templateCarcassID', 'templateInnerID', 'isVisibleSitemapXml', 'isVisibleSitemapHtml', 'isMainPage', 'isEnabled'], 'integer'],
            [['image1', 'image2', 'image3', 'datePublished', 'dateCreated', 'dateModified'], 'safe'],
            [['seoPriority'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     * @param integer $websiteID
     *
     * @return ActiveDataProvider
     */
    public function search($params, $websiteID)
    {
        $pageType = null;
        $type = \Yii::$app->request->get('type', null);
        if (isset($type))  {
            /**
             * @var PageType $pageType
             */
            $pageType = PageType::getPageTypeByAlias($type);
        }

        $query = Page::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id'                   => $this->id,
            'datePublished'        => $this->datePublished,
            'sort'                 => $this->sort,
            'authorID'             => $this->authorID,
            'seoPriority'          => $this->seoPriority,
            'pageTypeID'           => $this->pageTypeID,
            'ratingValue'          => $this->ratingValue,
            'ratingCount'          => $this->ratingCount,
            'isPaginationOn'       => $this->isPaginationOn,
            'paginationID'         => $this->paginationID,
            'paginationPerPage'    => $this->paginationPerPage,
            'templateCarcassID'    => $this->templateCarcassID,
            'templateInnerID'      => $this->templateInnerID,
            'isVisibleSitemapXml'  => $this->isVisibleSitemapXml,
            'isVisibleSitemapHtml' => $this->isVisibleSitemapHtml,
            'isMainPage'           => $this->isMainPage,
            'isEnabled'            => $this->isEnabled
        ]);

        if (isset($pageType)) {
            $query->andWhere([
                'pageTypeID' => $pageType->id
            ]);
        }

        $query->andWhere([
            'websiteID' => $websiteID,
            'isDeleted' => self::STATUS_NOT_DELETED
        ]);

        $query->andFilterWhere(['like', 'image1', $this->image1])
            ->andFilterWhere(['like', 'image2', $this->image2])
            ->andFilterWhere(['like', 'image3', $this->image3]);

        return $dataProvider;
    }
}
