<?php

namespace backend\controllers;
use backend\components\AccessHelper;
use backend\models\search\IContentSearch;
use common\models\Bean;
use common\models\BeanWebsite;
use yii\helpers\Url;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class CRUDWebsiteController
 * @package backend\controllers
 */
class CRUDWebsiteController extends CRUDController
{

    /**
     * Lists all models.
     * @return mixed
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

        if (isset($websiteID)) {
            $dataProvider = $searchModel->search(\Yii::$app->request->queryParams, $websiteID);
        }

        return $this->render('index', [
            'searchModel'  => $searchModel,
            'dataProvider' => $dataProvider,
            'websiteID'    => $websiteID
        ]);
    }

    /**
     * Return model by ID. Throws exception in the case the model wasn't found
     * @param int $id
     * @return mixed
     * @throws NotFoundHttpException
     */
    protected function findModel($id)
    {
        /**
         * @var Bean $className
         * @var Bean $bean
         */
        $className = $this->beanClass;
        $bean = new $className();
        $query = $className::find()->where(['id' => $id, 'websiteID' => \Yii::$app->request->websiteID]);
        if (!empty($bean->getMultiLanguageFields())) {
            $query = $query->multilingual();
        }
        if (($model = $query->one()) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * Get model for deleting with access checking
     * @param $id
     * @param bool $returnModel
     * @return mixed
     * @throws ForbiddenHttpException
     */
    public function actionDelete($id, $returnModel = false)
    {
        if ($returnModel) {
            return $this->getModel($id);
        }
        /**
         * @var BeanWebsite $model
         */
        $model = $this->findModel($id);
        $model->setScenario(BeanWebsite::SCENARIO_DELETE);
        $model->isDeleted = BeanWebsite::STATUS_DELETED;
        $model->save();
        return $this->redirect(Url::to([AccessHelper::formPrimaryUrl('index'), 'websiteID' => \Yii::$app->request->websiteID]));
    }

}