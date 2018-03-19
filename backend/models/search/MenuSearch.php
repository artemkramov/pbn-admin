<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Menu;

/**
 * MenuSearch represents the model behind the search form about `backend\models\Menu`.
 */
class MenuSearch extends Menu implements IContentSearch
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sort', 'parentID', 'pageID', 'menuTypeID', 'isEnabled', 'isDirect', 'isNewTab'], 'integer'],
            [['dateCreated', 'dateModified', 'image', 'url'], 'safe'],
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
        $query = Menu::find();

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
            'id'         => $this->id,
            'sort'       => $this->sort,
            'parentID'   => $this->parentID,
            'pageID'     => $this->pageID,
            'menuTypeID' => $this->menuTypeID,
            'isEnabled'  => $this->isEnabled,
            'isDirect'   => $this->isDirect,
            'isNewTab'   => $this->isNewTab
        ]);

        $query->andWhere([
            'websiteID' => $websiteID,
            'isDeleted' => self::STATUS_NOT_DELETED
        ]);

        $query->andFilterWhere(['like', 'image', $this->image])
            ->andFilterWhere(['like', 'url', $this->url]);

        return $dataProvider;
    }
}
