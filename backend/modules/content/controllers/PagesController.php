<?php

namespace backend\modules\content\controllers;

use backend\controllers\CRUDWebsiteController;
use backend\models\Page;
use backend\models\search\IContentSearch;
use backend\models\search\PageSearch;

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

}
