<?php

namespace backend\modules\content\controllers;

use backend\controllers\CRUDWebsiteController;
use backend\models\Page;
use backend\models\search\IContentSearch;
use backend\models\search\PageSearch;
use backend\models\Template;
use common\models\User;

/**
 * PagesController implements the CRUD actions for Page model.
 */
class PagesController extends CRUDWebsiteController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = Page::className();
        $this->beanSearchClass = PageSearch::className();
        parent::init();
    }

    /**
     * @return string
     */
    public function actionIndex()
    {
        /**
         * @var string $searchClass
         * @var IContentSearch $searchModel
         */
        $searchClass = $this->beanSearchClass;
        $searchModel = new $searchClass();

        $dataProvider = null;
        $websiteID = \Yii::$app->request->websiteID;
        $type = \Yii::$app->request->get('type', null);

        if (isset($websiteID)) {
            $dataProvider = $searchModel->search(\Yii::$app->request->queryParams, $websiteID);
        }

        return $this->render('index', [
            'searchModel'  => $searchModel,
            'dataProvider' => $dataProvider,
            'websiteID'    => $websiteID,
            'type'         => $type
        ]);
    }

    /**
     * @param array $extraParams
     * @return string|\yii\web\Response
     */
    public function actionCreate($extraParams = [])
    {
        $extraParams['templateCarcassID'] = null;
        $extraParams['templateInnerID'] = null;
        $type = \Yii::$app->request->get('type', null);
        if (User::isContentManager() && $type == 'post') {
            /**
             * @var Template $templateCarcass
             * @var Template $templateInner
             */
            $templateCarcass = Template::findByAliasAndType(Template::CARCASS_GENERAL, Template::TYPE_CARCASS);
            $templateInner = Template::findByAliasAndType(Template::TEMPLATE_POST, Template::TYPE_INNER);
            if (isset($templateCarcass)) {
                $extraParams['templateCarcassID'] = $templateCarcass->id;
            }
            if (isset($templateInner)) {
                $extraParams['templateInnerID'] = $templateInner->id;
            }
        }
        $extraParams['extraParams'] = $extraParams;
        return parent::actionCreate($extraParams);
    }

}
