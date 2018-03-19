<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\MenuSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="menu-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'dateCreated') ?>

    <?= $form->field($model, 'dateModified') ?>

    <?= $form->field($model, 'sort') ?>

    <?= $form->field($model, 'parentID') ?>

    <?php // echo $form->field($model, 'pageID') ?>

    <?php // echo $form->field($model, 'image') ?>

    <?php // echo $form->field($model, 'url') ?>

    <?php // echo $form->field($model, 'menuTypeID') ?>

    <?php // echo $form->field($model, 'isEnabled') ?>

    <?php // echo $form->field($model, 'isDirect') ?>

    <?php // echo $form->field($model, 'isNewTab') ?>

    <?php // echo $form->field($model, 'isDeleted') ?>

    <?php // echo $form->field($model, 'websiteID') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
