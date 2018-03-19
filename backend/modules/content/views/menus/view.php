<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Menu */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Menu::getLabels(), [
    'type'  => 'view',
    'field' => 'title'
]), $model);
?>
<div class="menu-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model'      => $model,
        'attributes' => [
            'id',
            'dateCreated',
            'dateModified',
            'sort',
            'url:url',
            [
                'attribute' => 'menuTypeID',
                'value'     => $model->menuType->name
            ],
            'isEnabled'
        ],
    ]) ?>

</div>
