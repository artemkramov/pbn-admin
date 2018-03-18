<?php

namespace backend\modules\content\controllers;

use backend\controllers\CRUDWebsiteController;
use backend\models\Route;
use backend\models\search\RouteSearch;

/**
 * RoutesController implements the CRUD actions for Route model.
 */
class RoutesController extends CRUDWebsiteController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = Route::className();
        $this->beanSearchClass = RouteSearch::className();
        parent::init();
    }

}
