<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\jui\DatePicker;
use backend\models\Template;
use backend\models\Pagination;
use backend\models\PageType;
use backend\components\SiteHelper;
use backend\models\Page;
use common\models\User;

/* @var $this yii\web\View */
/* @var $model backend\models\Page */
/* @var $form yii\widgets\ActiveForm */
/**
 * @var array $extraParams
 */

$this->registerJsFile(\Yii::$app->homeUrl . "/js/Page.js", [
    'depends' => [
        'yii\web\JqueryAsset'
    ]
]);

$type = Yii::$app->request->get('type', null);
$pageType = null;
if (isset($type)) {
    /**
     * @var PageType $pageType
     */
    $pageType = PageType::getPageTypeByAlias($type);
    if (isset($pageType) && $model->isNewRecord) {
        $model->pageTypeID = $pageType->id;
    }
}

if ($model->isNewRecord) {
    $model->datePublished = date('Y-m-d');
    $model->seoPriority = 0.5;
    $model->isVisibleSitemapXml = 1;
    $model->isVisibleSitemapHtml = 1;
    if (isset($type) && $type !== 'author') {
        $model->authorData = Page::getDefaultAuthor();
    }
    $model->isEnabled = 1;
    $model->isSeoPage = 1;
    if (isset($extraParams['templateCarcassID'])) {
        $model->templateCarcassID = $extraParams['templateCarcassID'];
    }
    if (isset($extraParams['templateInnerID'])) {
        $model->templateInnerID = $extraParams['templateInnerID'];
    }
}

?>

<div class="page-form">

    <?php $form = ActiveForm::begin([
        'enableAjaxValidation'   => true,
        'enableClientValidation' => false,
        'id'                     => 'kit-form',
        'validationUrl'          => \yii\helpers\Url::to(SiteHelper::formUrlForWebsite(['validate', 'id' => $model->id]))
    ]); ?>

    <!-- COMMON FIELDS FOR ALL ROLES -->

    <div class="row">
        <div class="col-sm-6">
            <?= \backend\widgets\related_bean\RelatedBean::widget([
                'label'           => 'Author',
                'controllerPopup' => '/content/pages/popup',
                'controllerView'  => '/content/pages/view',
                'inputName'       => 'Page[authorID]',
                'labelField'      => 'title',
                'relatedBean'     => $model->isNewRecord ? $model->authorData : $model->author,
                'extraGET'        => [
                    'type' => 'author'
                ],
                'options'         => [
                    'id' => 'authorID',
                ]
            ]) ?>
        </div>
        <div class="col-sm-6">
            <?= $form->field($model, 'datePublished')->widget(DatePicker::className(), [
                'options' => [
                    'class' => 'form-control'
                ]
            ]) ?>
        </div>
    </div>

    <?php
    echo $form->field($model, 'parentItems')->widget(\backend\widgets\multiple_bean\MultipleBean::className(), [
        'title' => 'Parent pages',
        'min'   => 0
    ])->label(false);
    ?>

    <?php
    echo $form->field($model, 'routes')->widget(\backend\widgets\multiple_bean\MultipleBean::className(), [
        'title'           => 'Link',
        'min'             => 1,
        'enableAddOption' => !User::isContentManager()
    ])->label(false);
    ?>

    <div class="row">
        <div class="col-sm-12">
            <?= \common\widgets\MultiLanguageInput::widget([
                'form'       => $form,
                'model'      => $model,
                'field'      => 'seoTitle',
                'parameters' => [
                ],
                'title'      => 'HTML title'
            ]); ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <?= \common\widgets\MultiLanguageInput::widget([
                'form'       => $form,
                'model'      => $model,
                'field'      => 'seoDescription',
                'parameters' => [
                ],
                'title'      => 'HTML description'
            ]); ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <?= \common\widgets\MultiLanguageInput::widget([
                'form'       => $form,
                'model'      => $model,
                'field'      => 'seoKeywords',
                'parameters' => [
                ],
                'title'      => 'HTML keywords'
            ]); ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <?= \common\widgets\MultiLanguageInput::widget([
                'form'       => $form,
                'model'      => $model,
                'field'      => 'title',
                'parameters' => [
                ],
                'title'      => 'Post title'
            ]); ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <?= \common\widgets\MultiLanguageInput::widget([
                'form'       => $form,
                'model'      => $model,
                'field'      => 'descriptionShort',
                'parameters' => [
                    'textarea' => [
                        'data-group' => 'common'
                    ]
                ],
                'title'      => 'Preview'
            ]); ?>
        </div>

    </div>

    <div class="row">
        <div class="col-sm-12">
            <?= \common\widgets\MultiLanguageInput::widget([
                'form'       => $form,
                'model'      => $model,
                'field'      => 'description',
                'parameters' => [
                    'textarea' => [
                        'data-group' => 'common'
                    ]
                ],
                'title'      => 'Post'
            ]); ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <?= $form->field($model, 'image1')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <?= $form->field($model, 'image2')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <?= $form->field($model, 'image3')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <!-- END COMMON FIELDS FOR ALL ROLES -->

    <!-- EXTRA FIELDS -->

    <div class="<?= User::isContentManager() ? 'hidden' : '' ?>">

        <div class="row">
            <div class="col-sm-6">
                <?= $form->field($model, 'templateCarcassID')->dropDownList(Template::listItems('carcass')) ?>
            </div>
            <div class="col-sm-6">
                <?= $form->field($model, 'templateInnerID')->dropDownList(Template::listItems('inner')) ?>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <?= $form->field($model, 'isPaginationOn')->checkbox() ?>
            </div>
            <div class="col-sm-6">
                <?= $form->field($model, 'showAllPosts')->checkbox() ?>
            </div>
        </div>

        <div class="row <?= !$model->isPaginationOn ? 'hidden' : '' ?>" id="pagination-row">
            <div class="col-sm-6">
                <?= $form->field($model, 'paginationID')->dropDownList(Pagination::listAll('id', 'template')) ?>
            </div>
            <div class="col-sm-6">
                <?= $form->field($model, 'paginationPerPage')->textInput() ?>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <?= $form->field($model, 'isEnabled')->checkbox() ?>
            </div>
            <div class="col-sm-6">
                <?= $form->field($model, 'isMainPage')->checkbox() ?>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <?= $form->field($model, 'isSeoPage')->checkbox() ?>
            </div>
            <div class="col-sm-6">
                <?= $form->field($model, 'seoPriority')->textInput(['maxlength' => true]) ?>
            </div>

        </div>

        <div class="row">
            <div class="col-sm-6">
                <?= $form->field($model, 'isVisibleSitemapXml')->checkbox() ?>
            </div>
            <div class="col-sm-6">
                <?= $form->field($model, 'isVisibleSitemapHtml')->checkbox() ?>
            </div>
        </div>

        <div class="row">
            <? if (isset($pageType)): ?>
                <?= $form->field($model, 'pageTypeID')->hiddenInput()->label(false) ?>
            <? else: ?>
                <div class="col-sm-6">
                    <?= $form->field($model, 'pageTypeID')->dropDownList(\backend\models\PageType::listAll()) ?>
                </div>
            <? endif; ?>
        </div>


        <?php
        echo $form->field($model, 'metaItems')->widget(\backend\widgets\multiple_bean\MultipleBean::className(), [
            'title' => 'Extra meta items',
            'min'   => 0
        ])->label(false);
        ?>
    </div>

    <!-- END EXTRA FIELDS -->

    <?= \backend\widgets\FormButtons::widget([
        'model' => $model
    ]); ?>

    <?php ActiveForm::end(); ?>

</div>
