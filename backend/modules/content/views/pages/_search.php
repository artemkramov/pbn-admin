<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\PageSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="page-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'image1') ?>

    <?= $form->field($model, 'image2') ?>

    <?= $form->field($model, 'image3') ?>

    <?= $form->field($model, 'datePublished') ?>

    <?php // echo $form->field($model, 'dateCreated') ?>

    <?php // echo $form->field($model, 'dateModified') ?>

    <?php // echo $form->field($model, 'sort') ?>

    <?php // echo $form->field($model, 'authorID') ?>

    <?php // echo $form->field($model, 'seoPriority') ?>

    <?php // echo $form->field($model, 'pageTypeID') ?>

    <?php // echo $form->field($model, 'ratingValue') ?>

    <?php // echo $form->field($model, 'ratingCount') ?>

    <?php // echo $form->field($model, 'isPaginationOn') ?>

    <?php // echo $form->field($model, 'paginationID') ?>

    <?php // echo $form->field($model, 'paginationPerPage') ?>

    <?php // echo $form->field($model, 'templateCarcassID') ?>

    <?php // echo $form->field($model, 'templateInnerID') ?>

    <?php // echo $form->field($model, 'isVisibleSitemapXml') ?>

    <?php // echo $form->field($model, 'isVisibleSitemapHtml') ?>

    <?php // echo $form->field($model, 'isMainPage') ?>

    <?php // echo $form->field($model, 'isEnabled') ?>

    <?php // echo $form->field($model, 'isDeleted') ?>

    <?php // echo $form->field($model, 'websiteID') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
