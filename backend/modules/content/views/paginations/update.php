<?php

use yii\helpers\Html;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\Pagination */

BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Pagination::getLabels(), [
    'type'  => 'update',
    'field' => 'template'
]), $model);
?>
<div class="pagination-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
