<?php

namespace backend\modules\content\controllers;

use backend\controllers\CRUDWebsiteController;
use backend\models\Pagination;
use backend\models\search\PaginationSearch;

/**
 * PaginationsController implements the CRUD actions for Pagination model.
 */
class PaginationsController extends CRUDWebsiteController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = Pagination::className();
        $this->beanSearchClass = PaginationSearch::className();
        parent::init();
    }

}
