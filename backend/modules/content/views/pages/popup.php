<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\components\BreadcrumbHelper;
use backend\components\SiteHelper;
use backend\models\PageType;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\PageSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/**
 * @var string $type
 * @var string $openerID
 * @var string $labelField
 */


$labels = \backend\models\Page::getLabels();
BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'index'
]));
?>
<div class="page-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <? if (isset($dataProvider)): ?>

        <?

        $dataWidgetColumns = [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'title',
                'label'     => \common\modules\i18n\Module::t('Title'),
                'format'    => 'raw',
                'value'     => function ($model) use ($openerID, $labelField) {
                    /**
                     * @var \backend\models\Page $model
                     */
                    return Html::a($model->title, '#', [
                        'class'       => 'btn-to-relation-input',
                        'data-id'     => $model->id,
                        'data-label'  => $model->{$labelField},
                        'data-url'    => \yii\helpers\Url::to(SiteHelper::formUrlForWebsite(['view', 'id' => $model->id, 'type' => $model->pageType->alias])),
                        'data-opener' => $openerID
                    ]);
                },
            ],
            'datePublished'
        ];

        $type = Yii::$app->request->get('type', null);
        if (!isset($type)) {
            $dataWidgetColumns[] = [
                'attribute' => 'pageTypeID',
                'value'     => function ($model) {
                    /**
                     * @var \backend\models\Page $model
                     */
                    return $model->pageType->name;
                },
                'filter'    => Html::activeDropDownList($searchModel, 'pageTypeID', ['' => ''] + PageType::listAll(),
                    [
                        'class' => 'form-control'
                    ])

            ];
        }

        ?>

        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel'  => $searchModel,
            'columns'      => $dataWidgetColumns,
        ]); ?>

    <? endif; ?>
</div>
