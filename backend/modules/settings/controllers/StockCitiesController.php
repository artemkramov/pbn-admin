<?php

namespace backend\modules\settings\controllers;

use backend\controllers\CRUDController;
use backend\models\Stock;
use common\models\StockCity;
use common\models\Search\StockCitySearch;
use common\modules\i18n\Module;
use yii\web\NotFoundHttpException;

/**
 * StockCitiesController implements the CRUD actions for StockCity model.
 */
class StockCitiesController extends CRUDController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = StockCity::className();
        $this->beanSearchClass = StockCitySearch::className();
        parent::init();
    }

    /**
     * Sort and position action for menu
     * @param integer $id
     * @throws NotFoundHttpException
     * @return string
     */
    public function actionSortShops($id = null)
    {
        $beanClass = $this->beanClass;
        $group = $beanClass::findOne($id);
        if (empty($group)) {
            throw new NotFoundHttpException();
        }
        if (\Yii::$app->request->post()) {
            $jsonTree = \Yii::$app->request->post('jsonTree');
            if (!empty($jsonTree)) {
                Stock::saveSortPositions($jsonTree);
                \Yii::$app->session->setFlash('success', Module::t('Operation is done successfully.'));
                return $this->redirect(['sort-shops', 'id' => $id]);
            }
        }
        return $this->render('sort-shops', [
            'group' => $group
        ]);
    }

}
