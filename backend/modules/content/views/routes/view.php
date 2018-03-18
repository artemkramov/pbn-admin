<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Route */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Route::getLabels(), [
    'type'  => 'view',
    'field' => 'name'
]), $model);
?>
<div class="route-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'name',
            'link',
            'priority',
            [
                'attribute' => 'websiteID',
                'value'     => $model->website->url
            ]
        ],
    ]) ?>

</div>
