<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\StockSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$labels = \backend\models\Stock::getLabels();
BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'index'
]));
?>
<div class="stock-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= \backend\widgets\FormButtons::widget([
            'model'      => false,
            'type'       => 'create',
            'modelLabel' => $labels['singular']
        ]); ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'title',
                'label'     => \common\modules\i18n\Module::t('Title'),
                'value'     => function ($model) {
                    /**
                     * @var \backend\models\Stock $model
                     */
                    return $model->getPostTitle();
                }
            ],
            [
                'attribute' => 'created_at',
                'format'    => 'datetime',
            ],
            [
                'attribute' => 'stock_city_id',
                'value' => function ($model) {
                    /**
                     * @var \backend\models\Stock $model
                     */
                    return $model->stockCity->title;
                },
                'filter' => Html::activeDropDownList($searchModel, 'stock_city_id', ['' => ''] + \common\models\StockCity::listAllLocalized(),
                    [
                        'class' => 'form-control'
                    ])
            ],
            [
                'attribute' => 'enabled',
                'value' => function ($model) {
                    return \backend\components\SiteHelper::getCheckboxSign($model->enabled);
                },
                'filter' => Html::activeDropDownList($searchModel, 'enabled', \backend\components\SiteHelper::getCheckboxDropdown(),
                    [
                        'class' => 'form-control'
                    ])
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
