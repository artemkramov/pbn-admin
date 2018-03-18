<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Website */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Website::getLabels(), [
    'type'  => 'view',
    'field' => 'url'
]), $model);
?>
<div class="website-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model'      => $model,
        'attributes' => [
            'id',
            'url:ntext',
            'dsn:ntext',
            'username',
            'password:ntext',
            'isRemoteConnection',
        ],
    ]) ?>

</div>
