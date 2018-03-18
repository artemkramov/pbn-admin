<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\WebsiteSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$labels = \backend\models\Website::getLabels();
BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'index'
]));
?>
<div class="website-index">

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
        'filterModel'  => $searchModel,
        'columns'      => [
            ['class' => 'yii\grid\SerialColumn'],

            'url:ntext',
            [
                'attribute' => 'isRemoteConnection',
                'value'     => function ($model) {
                    /**
                     * @var \backend\models\Website $model
                     */
                    return \backend\components\SiteHelper::getCheckboxSign($model->isRemoteConnection);
                },
                'filter'    => Html::activeDropDownList($searchModel, 'isRemoteConnection', \backend\components\SiteHelper::getCheckboxDropdown(),
                    [
                        'class' => 'form-control'
                    ])
            ],
            [
                'class'    => 'yii\grid\ActionColumn',
                'template' => \backend\components\SiteHelper::getListTemplate([
                    'view', 'update', 'delete'
                ])
            ]
        ],
    ]); ?>
</div>
