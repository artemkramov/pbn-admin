<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Pagination */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Pagination::getLabels(), [
    'type'  => 'view',
    'field' => 'template'
]), $model);
?>
<div class="pagination-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'template',
            [
                'attribute' => 'websiteID',
                'value'     => $model->website->url
            ]
        ],
    ]) ?>

</div>
