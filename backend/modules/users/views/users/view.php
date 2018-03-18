<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use common\modules\i18n\Module;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $model common\models\User */
/**
 * @var array $userPermission
 */

BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\common\models\User::getLabels(), [
    'type'  => 'view',
    'field' => 'username'
]), $model);
?>
<div class="user-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= \backend\widgets\DetailViewButtons::widget([
        'model' => $model
    ]) ?>

    <?= DetailView::widget([
        'model'      => $model,
        'attributes' => [
            [
                'label' => Module::t('Id'),
                'value' => $model->id
            ],
            [
                'label' => Module::t('Username'),
                'value' => $model->username,
            ],
            [
                'label' => Module::t('Email'),
                'value' => $model->email
            ],
            [
                'label'  => Module::t('Createdat'),
                'value'  => $model->dateCreated,
                'format' => 'datetime'
            ],
            [
                'label'  => Module::t('Updatedat'),
                'value'  => $model->dateUpdated,
                'format' => 'datetime'
            ],
            [
                'label' => Module::t('Roles'),
                'value' => implode(',', $userPermission)
            ]
        ],
    ]) ?>

</div>
