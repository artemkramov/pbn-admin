<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\PageTypeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$labels = \backend\models\PageType::getLabels();
BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'index'
]));
?>
<div class="page-type-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= \backend\widgets\WebsiteFilter::widget([
        'action' => ['page-types/index']
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
                'alias',

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
