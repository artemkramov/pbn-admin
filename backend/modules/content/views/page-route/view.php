<?

use yii\helpers\Html;

/**
 * @var string $attribute
 * @var array $attributesData
 * @var int $min
 * @var \backend\models\PageRoute $model
 * @var integer $defaultSelectedRoute
 */

?>
<div class="panel panel-default panel-item" data-item="<?= $attribute ?>"
     data-counter="<?= $counter ?>">
    <div class="panel-body">
        <? if ($counter >= $min || !is_numeric($counter)): ?>
            <div class="clearfix">
                <div class="btn btn-danger btn-delete-bean pull-right">
                    <i class="glyphicon glyphicon-remove"></i>
                </div>
            </div>
        <? endif; ?>
        <div class="row">
            <div class="col-sm-6">
                <label><?= 'Alias' ?></label>
                <div class="form-group field-<?= $attributesData['alias']['id'] ?>">
                    <?
                    echo Html::textInput('Page[routes][alias][' . $counter . ']', $model->alias, ['class' => 'form-control field-alias', 'id' => $attributesData['alias']['id']]);
                    ?>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-sm-6">
                <label><?= 'Route' ?></label>
                <div class="form-group field-<?= $attributesData['routeID']['id'] ?>">
                    <?
                    echo Html::dropDownList('Page[routes][routeID][' . $counter . ']', $model->isNewRecord ? $defaultSelectedRoute : $model->routeID, \backend\models\Route::listAll(), ['class' => 'form-control field-route-id', 'id' => $attributesData['routeID']['id']]);
                    ?>
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
    </div>
</div>