<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\PageType */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\PageType::getLabels(), [
    'type'  => 'view',
    'field' => 'name'
]), $model);
?>
<div class="page-type-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'name',
            'alias',
            [
                'attribute' => 'websiteID',
                'value'     => $model->website->url
            ]
        ],
    ]) ?>

</div>
