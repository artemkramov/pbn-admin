<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Menu;
use backend\models\Page;

/* @var $this yii\web\View */
/* @var $model backend\models\Menu */
/* @var $form yii\widgets\ActiveForm */

$this->registerJsFile(\Yii::$app->homeUrl . "/js/Menu.js", [
    'depends' => [
        'yii\web\JqueryAsset'
    ]
]);

?>

<div class="menu-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= \common\widgets\MultiLanguageInput::widget([
        'form'       => $form,
        'model'      => $model,
        'field'      => 'title',
        'parameters' => [
        ],
        'title'      => \common\modules\i18n\Module::t('Title')
    ]); ?>

    <div class="row">
        <div class="col-sm-6">
            <?= $form->field($model, 'parentID')->dropDownList(Menu::getMenuDropdown($model->id), ['class' => 'form-control']) ?>
            <script>
                window.parentID = '<?= $model->parentID ?>';
            </script>
        </div>
        <div class="col-sm-6">
            <?= $form->field($model, 'sort')->textInput() ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <?= $form->field($model, 'pageID')->dropDownList(Page::listAllLocalized()) ?>
        </div>
        <div class="col-sm-6">
            <?= $form->field($model, 'isEnabled')->checkbox() ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <?= $form->field($model, 'menuTypeID')->dropDownList(\backend\models\MenuType::listAll()) ?>
        </div>
        <div class="col-sm-6">
            <?= $form->field($model, 'isNewTab')->checkbox() ?>
        </div>
    </div>

    <? $isCustomUrl = isset($model->url);
    $class = $isCustomUrl ? '' : 'hidden';
    ?>
    <?= $form->field($model, 'isCustomUrl')->checkbox(['class' => 'spoiler-checkbox', 'data-toggle' => 'isCustomUrl']) ?>
    <div class="<?= $class?>" data-container="isCustomUrl">
        <?= $form->field($model, 'url')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'isDirect')->checkbox() ?>
    </div>

    <?= \backend\widgets\FormButtons::widget([
        'model' => $model
    ]); ?>

    <?php ActiveForm::end(); ?>

</div>
