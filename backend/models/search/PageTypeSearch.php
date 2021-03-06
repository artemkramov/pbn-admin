<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\PageType;

/**
 * PageTypeSearch represents the model behind the search form about `backend\models\PageType`.
 */
class PageTypeSearch extends PageType implements IContentSearch
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'isDeleted'], 'integer'],
            [['name', 'alias'], 'safe'],
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
        $query = PageType::find();

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
            'id' => $this->id
        ]);

        $query->andWhere([
            'websiteID' => $websiteID,
            'isDeleted' => self::STATUS_NOT_DELETED
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'alias', $this->alias]);

        return $dataProvider;
    }
}
