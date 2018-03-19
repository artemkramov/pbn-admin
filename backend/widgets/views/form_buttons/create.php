<?
use common\modules\i18n\Module;
use \backend\components\SiteHelper;

/**
 * @var string $modelLabel
 */

$icon = \yii\helpers\Html::tag('span', '', ['class' => 'fa fa-plus']);

if (SiteHelper::checkActionPermission(['create'])) {
    echo \yii\helpers\Html::a(sprintf("%s %s %s", $icon, Module::t('Create '), $modelLabel),
        SiteHelper::formUrlForWebsite([\backend\components\AccessHelper::formPrimaryUrl('create')]), ['class' => 'btn btn-success']);
}