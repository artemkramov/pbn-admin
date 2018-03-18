<?php

use yii\helpers\Html;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\Website */

BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Website::getLabels(), [
    'type'  => 'update',
    'field' => 'url'
]), $model);
?>
<div class="website-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
