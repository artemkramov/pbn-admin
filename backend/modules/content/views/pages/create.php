<?php

use yii\helpers\Html;
use backend\components\BreadcrumbHelper;


/* @var $this yii\web\View */
/* @var $model backend\models\Page */

$type = Yii::$app->request->get('type', null);
BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge(\backend\models\Page::getLabels($type), [
    'type' => 'create'
]), $model);
?>
<div class="page-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
