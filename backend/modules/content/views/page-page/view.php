<?

use common\modules\i18n\Module;

/**
 * @var string $attribute
 * @var array $attributesData
 * @var int $min
 * @var \backend\models\PagePage $model
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
                <?= \backend\widgets\related_bean\RelatedBean::widget([
                    'label'           => 'Page',
                    'controllerPopup' => '/content/pages/popup',
                    'controllerView'  => '/content/pages/view',
                    'inputName'       => $attributesData['pageParentID']['name'],
                    'labelField'      => 'title',
                    'relatedBean'     => $model->pageParent,
                    'options'         => [
                        'id' => $attributesData['pageParentID']['id'],
                    ]
                ]) ?>

            </div>
        </div>
    </div>
</div>