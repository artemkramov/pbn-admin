<?php

namespace backend\widgets;

use backend\models\Website;
use yii\base\Widget;

/**
 * Class WebsiteFilter
 * @package backend\widgets
 */
class WebsiteFilter extends Widget
{
    /**
     * @var string
     */
    public $action;

    /**
     * @return string
     */
    public function run()
    {
        parent::run();
        $websites = Website::listAll('id', 'url');
        $websiteID = \Yii::$app->request->websiteID;
        return $this->render('websites-filter/view', [
            'websites'  => $websites,
            'websiteID' => $websiteID,
            'action'    => $this->action
        ]);
    }

}