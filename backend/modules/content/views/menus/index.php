<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\MenuSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$labels = \backend\models\Menu::getLabels();
BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'index'
]));
?>
<div class="menu-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= \backend\widgets\WebsiteFilter::widget([
        'action' => ['menus/index']
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

                'title',
                'dateCreated',
                'dateModified',
                [
                    'attribute' => 'menuTypeID',
                    'value'     => function ($model) {
                        /**
                         * @var \backend\models\Menu $model
                         */
                        return isset($model->menuType) ? $model->menuType->name : '';
                    },
                    'filter'    => Html::activeDropDownList($searchModel, 'menuTypeID', ['' => ''] + \backend\models\MenuType::listAll(),
                        [
                            'class' => 'form-control'
                        ])
                ],

                [
                    'attribute' => 'isEnabled',
                    'value'     => function ($model) {
                        /**
                         * @var \backend\models\Menu $model
                         */
                        return \backend\components\SiteHelper::getCheckboxSign($model->isEnabled);
                    },
                    'filter'    => Html::activeDropDownList($searchModel, 'isEnabled', \backend\components\SiteHelper::getCheckboxDropdown(),
                        [
                            'class' => 'form-control'
                        ])
                ],

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
