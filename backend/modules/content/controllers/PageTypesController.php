<?php

namespace backend\modules\content\controllers;

use backend\controllers\CRUDWebsiteController;
use backend\models\PageType;
use backend\models\search\PageTypeSearch;

/**
 * PageTypesController implements the CRUD actions for PageType model.
 */
class PageTypesController extends CRUDWebsiteController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = PageType::className();
        $this->beanSearchClass = PageTypeSearch::className();
        parent::init();
    }

}
