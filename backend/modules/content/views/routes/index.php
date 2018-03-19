<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\RouteSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$labels = \backend\models\Route::getLabels();
BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'index'
]));
?>
<div class="route-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= \backend\widgets\WebsiteFilter::widget([
        'action' => ['routes/index']
    ]); ?>

    <? if (isset($dataProvider)): ?>

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

                'name',
                'link',
                'priority',

                [
                    'class'    => 'yii\grid\ActionColumn',
                    'template' => \backend\components\SiteHelper::getListTemplate([
                        'view', 'update', 'delete'
                    ]),
                    'buttons'  => \backend\components\SiteHelper::getListButtons()
                ]
            ],
        ]); ?>
    <? endif; ?>
</div>
