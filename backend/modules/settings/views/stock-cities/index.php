<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\Search\StockCitySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$labels = \common\models\StockCity::getLabels();
\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'index'
]));
?>
<div class="stock-city-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= \backend\widgets\FormButtons::widget([
            'model'      => false,
            'type'       => 'create',
            'modelLabel' => $labels['singular']
        ]); ?>
        <?= \backend\widgets\FormButtons::widget([
            'model'      => false,
            'type'       => 'sort',
            'modelLabel' => $labels['singular']
        ]); ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel'  => $searchModel,
        'columns'      => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'title',
                'label'     => \common\modules\i18n\Module::t('Title')
            ],
            [
                'attribute' => 'created_at',
                'format'    => 'datetime',
            ],
            [
                'attribute' => 'updated_at',
                'format'    => 'datetime'
            ],
            [
                'attribute' => 'enabled',
                'value'     => function ($model) {
                    return \backend\components\SiteHelper::getCheckboxSign($model->enabled);
                },
                'filter'    => Html::activeDropDownList($searchModel, 'enabled', \backend\components\SiteHelper::getCheckboxDropdown(),
                    [
                        'class' => 'form-control'
                    ])
            ],

            [
                'class'    => 'yii\grid\ActionColumn',
                'buttons'  => [
                    'sort-shops' => function ($url, $model) {
                        $icon = "sort";
                        return Html::a('<span class="fa fa-' . $icon . '"></span> ', $url);
                    }
                ],
                'template' => '{sort-shops} {view} {update} {delete}'
            ],
        ],
    ]); ?>
</div>
