<?
use yii\bootstrap\Html;
use common\modules\i18n\Module;
use backend\components\SiteHelper;

/** @var $model \common\models\Bean */

?>
<div class="form-group">
    <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    <?
    if (SiteHelper::checkActionPermission(['index'])) {
        echo Html::a('Back to list', SiteHelper::formUrlForWebsite([\backend\components\AccessHelper::formPrimaryUrl('index')]), ['class' => 'btn btn-default']);
    } ?>
</div>