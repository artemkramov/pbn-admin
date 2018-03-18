<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StockCity */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\common\models\StockCity::getLabels(), [
    'type'        => 'view',
    'customTitle' => $model->title
]), $model);
?>
<div class="stock-city-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'attribute' => 'created_at',
                'format'    => 'datetime',
            ],
            [
                'attribute' => 'updated_at',
                'format'    => 'datetime'
            ],
            'sort',
            'enabled'
        ],
    ]) ?>

</div>
