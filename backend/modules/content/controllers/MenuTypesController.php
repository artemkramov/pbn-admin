<?php

namespace backend\modules\content\controllers;

use backend\components\SiteHelper;
use backend\controllers\CRUDWebsiteController;
use backend\models\Menu;
use backend\models\MenuType;
use backend\models\search\MenuTypeSearch;

/**
 * MenuTypesController implements the CRUD actions for MenuType model.
 */
class MenuTypesController extends CRUDWebsiteController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = MenuType::className();
        $this->beanSearchClass = MenuTypeSearch::className();
        parent::init();
    }

    /**
     * Sort and position action for menu
     * @param $id
     * @return string
     */
    public function actionSort($id = null)
    {
        $menuType = $this->findModel($id);
        if (\Yii::$app->request->post()) {
            $jsonTree = \Yii::$app->request->post('jsonTree');
            if (!empty($jsonTree)) {
                Menu::saveMenuTree($jsonTree);
                \Yii::$app->session->setFlash('success', 'Operation is done successfully.');
                return $this->redirect(SiteHelper::formUrlForWebsite(['sort', 'id' => $id]));
            }
        }
        return $this->render('sort', [
            'menuType' => $menuType
        ]);
    }

}
