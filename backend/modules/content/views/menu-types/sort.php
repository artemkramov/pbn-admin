<?

use backend\components\BreadcrumbHelper;
use backend\components\SiteHelper;
use yii\helpers\Url;

/**
 * @var \backend\models\MenuType $menuType
 */

$this->registerJsFile('/js/Sort.js', ['depends' => [\yii\web\JqueryAsset::className()]]);
$labels = \backend\models\Menu::getLabels();

BreadcrumbHelper::set($this, \yii\helpers\ArrayHelper::merge($labels, [
    'type' => 'sort'
]));
?>
<div class="menu-view">
    <div id="tree1" class="form-group">

    </div>
    <?= \yii\helpers\Html::hiddenInput('', Url::to(SiteHelper::formUrlForWebsite(['/ajax/load-menu-items', 'id' => $menuType->id])), ['id' => 'url-load-items'])?>
    <? $form = \yii\bootstrap\ActiveForm::begin([
        'options' => [
            'class' => 'form-sort'
        ]
    ]); ?>

    <div class="form-group">
        <?
        $fakeModel = new \backend\models\Menu();
        $fakeModel->isNewRecord = false;
        echo \backend\widgets\FormButtons::widget([
            'model' => $fakeModel
        ]); ?>
    </div>
    <? \yii\bootstrap\ActiveForm::end(); ?>
</div>