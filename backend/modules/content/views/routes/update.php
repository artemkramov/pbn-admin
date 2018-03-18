<?php

use yii\helpers\Html;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\Route */

BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Route::getLabels(), [
    'type'  => 'update',
    'field' => 'name'
]), $model);
?>
<div class="route-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
