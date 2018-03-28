<?php
use yii\helpers\Html;
use common\models\User;
use common\modules\i18n\Module;
use yii\helpers\Url;
use common\models\Lang;

/* @var $this \yii\web\View */
/* @var $content string
 * @var Lang $currentLanguage
 */

$currentLanguage = Lang::getCurrent();
$websiteID = Yii::$app->request->websiteID;
$website = null;
if (isset($websiteID)) {
    /**
     * @var \backend\models\Website $website
     */
    $website = \backend\models\Website::findOne($websiteID);
}

?>

<header class="main-header">

    <?= Html::a('<span class="logo-mini">' . Yii::$app->name . '</span><span class="logo-lg">' . Yii::$app->name . '</span>', Yii::$app->homeUrl, ['class' => 'logo']) ?>
    <nav class="navbar navbar-static-top" role="navigation">

        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <? if (isset($website)): ?>
            <div class="header-website-name">
                <?= $website->url ?>
            </div>
        <? endif; ?>
        <? //=\Yii::t('test-lang',"msg");?>
        <div class="navbar-custom-menu">

            <ul class="nav navbar-nav">

                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<?= User::getUserLogoPath() ?>" class="user-image" alt="User Image"/>
                        <span class="hidden-xs"><?= \Yii::$app->user->identity->username ?></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="<?= User::getUserLogoPath() ?>" class="img-circle"
                                 alt="User Image"/>

                            <p>
                                <?= \Yii::$app->user->identity->username ?>
                            </p>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                            </div>
                            <div class="pull-right">
                                <?= Html::a(
                                    \common\modules\i18n\Module::t('Sign out'),
                                    ['/site/logout'],
                                    ['data-method' => 'post', 'class' => 'btn btn-default btn-flat']
                                ) ?>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="modal_load"><!-- Place at bottom of page --></div>
<div class="">
    <?
    echo $this->render('../includes/alert');
    echo $this->render('../includes/confirm');
    ?>
</div>
<div>
    <? $javascriptLabels = \common\models\Lang::getJavascriptLabels(); ?>
</div>

<script>
    var no_image = '<?=  \Yii::getAlias("@web") . "/uploads/images/no-image.png"?>';
    window.siteUrl = '<?= \Yii::$app->request->hostInfo . "/" . \common\models\Lang::getCurrent()->url . "/"?>';
    window.websiteID = '<?= Yii::$app->request->websiteID; ?>';
    var dateFormat = '<?=  yii\helpers\FormatConverter::convertDatePhpToJui(\common\components\TimeDate::getDefaultDateType());?>';
    var lang = '<?= \common\models\Lang::getCurrent()->url?>';
    var current_url = '<?= \yii\helpers\Url::current()?>';
    var javascriptJSONLabels = '<?= json_encode($javascriptLabels) ?>';
</script>
