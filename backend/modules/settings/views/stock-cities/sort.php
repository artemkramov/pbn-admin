<?

use backend\components\BreadcrumbHelper;

$this->registerJsFile('/admin/js/Sort.js', ['depends' => [\yii\web\JqueryAsset::className()]]);
$labels = \common\models\StockCity::getLabels();

BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'sort'
]));
?>
<div class="menu-view">
    <div id="tree1" class="form-group">

    </div>
    <?= \yii\helpers\Html::hiddenInput('', 'admin/ajax/load-stock-cities', ['id' => 'url-load-items'])?>
    <? $form = \yii\bootstrap\ActiveForm::begin([
        'options' => [
            'class' => 'form-sort'
        ]
    ]); ?>

    <div class="form-group">
        <?
        $fakeModel = new \common\models\StockCity();
        $fakeModel->isNewRecord = false;
        echo \backend\widgets\FormButtons::widget([
            'model' => $fakeModel
        ]); ?>
    </div>
    <? \yii\bootstrap\ActiveForm::end(); ?>
</div>