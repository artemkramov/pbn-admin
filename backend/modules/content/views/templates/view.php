<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Template */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Template::getLabels(), [
    'type'  => 'view',
    'field' => 'name'
]), $model);
?>
<div class="template-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [

            'name',
            'alias',
            'type',
            [
                'attribute' => 'websiteID',
                'value'     => $model->website->url
            ]
        ],
    ]) ?>

</div>
