<?php

namespace backend\modules\settings\controllers;

use backend\controllers\CRUDController;
use backend\models\Website;
use backend\models\search\WebsiteSearch;

/**
 * WebsitesController implements the CRUD actions for Website model.
 */
class WebsitesController extends CRUDController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = Website::className();
        $this->beanSearchClass = WebsiteSearch::className();
        parent::init();
    }

}
