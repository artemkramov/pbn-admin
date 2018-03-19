<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\MenuType */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\MenuType::getLabels(), [
    'type'  => 'view',
    'field' => 'name'
]), $model);
?>
<div class="menu-type-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model'      => $model,
        'attributes' => [
            'alias',
            'name',
            [
                'attribute' => 'websiteID',
                'value'     => $model->website->url
            ]
        ],
    ]) ?>

</div>
