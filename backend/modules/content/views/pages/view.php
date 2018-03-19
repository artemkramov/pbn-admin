<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Page */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Page::getLabels(), [
    'type'  => 'view',
    'field' => 'title'
]), $model);
?>
<div class="page-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model'      => $model,
        'attributes' => [
            'id',
            'datePublished',
            'dateCreated',
            'dateModified',
            'isEnabled'
        ],
    ]) ?>

</div>
