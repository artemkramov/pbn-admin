<?php

namespace backend\modules\content\controllers;

use backend\controllers\CRUDWebsiteController;
use backend\models\Menu;
use backend\models\search\MenuSearch;

/**
 * MenusController implements the CRUD actions for Menu model.
 */
class MenusController extends CRUDWebsiteController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = Menu::className();
        $this->beanSearchClass = MenuSearch::className();
        parent::init();
    }

}
