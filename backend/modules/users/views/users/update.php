<?php

use yii\helpers\Html;
use backend\components\BreadcrumbHelper;

/* @var $this yii\web\View */
/* @var $model common\models\User */
/**
 * @var array $userPermission
 * @var array $roles
 */

BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\common\models\User::getLabels(), [
    'type'  => 'update',
    'field' => 'username'
]), $model);
?>
<div class="user-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model'          => $model,
        'userPermission' => $userPermission,
        'roles'          => $roles
    ]) ?>

</div>
