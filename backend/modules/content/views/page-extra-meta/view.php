<?

use yii\helpers\Html;

/**
 * @var string $attribute
 * @var array $attributesData
 * @var int $min
 * @var \backend\models\PageExtraMeta $model
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
                <label><?= 'Name' ?></label>
                <div class="form-group field-<?= $attributesData['name']['id'] ?>">
                    <?
                    echo Html::textInput('Page[metaItems][name][' . $counter . ']', $model->name, ['class' => 'form-control field-name', 'id' => $attributesData['name']['id']]);
                    ?>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-sm-6">
                <label><?= 'Content' ?></label>
                <div class="form-group field-<?= $attributesData['content']['id'] ?>">
                    <?
                    echo Html::textInput('Page[metaItems][content][' . $counter . ']', $model->content, ['class' => 'form-control field-content', 'id' => $attributesData['content']['id']]);
                    ?>
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
    </div>
</div>