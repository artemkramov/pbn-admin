<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PageType */

\backend\components\BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\PageType::getLabels(), [
    'type'  => 'update',
    'field' => 'name'
]), $model);
?>
<div class="page-type-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
