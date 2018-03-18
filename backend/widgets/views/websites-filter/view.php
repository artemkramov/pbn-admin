<?php

use yii\bootstrap\ActiveForm;
use yii\bootstrap\Html;

/**
 * @var array $websites
 * @var int $websiteID
 * @var string $action
 */

$icon = Html::tag('span', '', ['class' => 'fa fa-search']);

?>

<!-- CHOOSE WEBSITE -->
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-6">


                <? $form = ActiveForm::begin([
                    'method' => 'GET',
                    'action' => $action
                ]); ?>

                <div class="form-group">
                    <?= Html::label('Choose website'); ?>

                    <?= Html::dropDownList('websiteID', $websiteID, $websites, [
                        'class' => 'form-control form-dropdown-search'
                    ]) ?>
                </div>

                <div class="form-group">

                    <?= Html::submitButton(sprintf("%s %s", $icon, 'Search'), [
                        'class' => 'btn btn-primary'
                    ]) ?>

                </div>


                <? ActiveForm::end(); ?>
            </div>
        </div>
    </div>
</div>
