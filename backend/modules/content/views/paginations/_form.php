<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Pagination */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pagination-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-sm-6">
            <?= $form->field($model, 'template')->textInput(['maxlength' => true]) ?>
        </div>
        <? if ($model->isNewRecord): ?>
            <div class="col-sm-6">
                <?= $form->field($model, 'websiteID')->dropDownList(\backend\models\Website::listAll('id', 'url')) ?>
            </div>
        <? endif; ?>
    </div>

    <?= \backend\widgets\FormButtons::widget([
        'model' => $model
    ]); ?>

    <?php ActiveForm::end(); ?>

</div>
