<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Page */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="page-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'image1')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'image2')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'image3')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'datePublished')->textInput() ?>

    <?= $form->field($model, 'dateCreated')->textInput() ?>

    <?= $form->field($model, 'dateModified')->textInput() ?>

    <?= $form->field($model, 'sort')->textInput() ?>

    <?= $form->field($model, 'authorID')->textInput() ?>

    <?= $form->field($model, 'seoPriority')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pageTypeID')->textInput() ?>

    <?= $form->field($model, 'ratingValue')->textInput() ?>

    <?= $form->field($model, 'ratingCount')->textInput() ?>

    <?= $form->field($model, 'isPaginationOn')->textInput() ?>

    <?= $form->field($model, 'paginationID')->textInput() ?>

    <?= $form->field($model, 'paginationPerPage')->textInput() ?>

    <?= $form->field($model, 'templateCarcassID')->textInput() ?>

    <?= $form->field($model, 'templateInnerID')->textInput() ?>

    <?= $form->field($model, 'isVisibleSitemapXml')->textInput() ?>

    <?= $form->field($model, 'isVisibleSitemapHtml')->textInput() ?>

    <?= $form->field($model, 'isMainPage')->textInput() ?>

    <?= $form->field($model, 'isEnabled')->textInput() ?>

    <?= $form->field($model, 'isDeleted')->textInput() ?>

    <?= $form->field($model, 'websiteID')->textInput() ?>

    <?= \backend\widgets\FormButtons::widget([
        'model' => $model
    ]); ?>

    <?php ActiveForm::end(); ?>

</div>
