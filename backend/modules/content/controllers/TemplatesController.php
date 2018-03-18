<?php

namespace backend\modules\content\controllers;

use backend\controllers\CRUDWebsiteController;
use backend\models\Template;
use backend\models\search\TemplateSearch;


/**
 * TemplatesController implements the CRUD actions for Template model.
 */
class TemplatesController extends CRUDWebsiteController
{

    /**
     * Init bean class
     */
    public function init()
    {
        $this->beanClass = Template::className();
        $this->beanSearchClass = TemplateSearch::className();
        parent::init();
    }

}
