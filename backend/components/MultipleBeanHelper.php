<?php
/**
 * Created by PhpStorm.
 * User: artem
 * Date: 5/31/16
 * Time: 1:45 PM
 */

namespace backend\components;


use backend\models\Characteristic;
use backend\models\CharacteristicGroup;
use backend\models\Currency;
use backend\models\KitProduct;
use backend\models\PageExtraMeta;
use backend\models\PagePage;
use backend\models\PageRoute;
use backend\models\PageType;
use backend\models\Product;
use backend\models\ProductGallery;
use backend\models\ProductVariation;
use backend\models\SliderItem;
use common\models\Address;
use common\models\Country;
use common\models\MagazineItem;
use common\models\OrderItem;
use common\models\SaleProduct;
use yii\helpers\ArrayHelper;

/**
 * Class for handling of the one-to-many entities (like multiple addresses to one user e.t.c)
 * */
class MultipleBeanHelper
{

    /**
     * Generate ID attribute for a field based on it's name and counter
     * @param $field
     * @param $attribute
     * @param $modelClass
     * @param $counter
     * @return string
     */
    public static function formIdAttribute($field, $attribute, $modelClass, $counter)
    {
        $data = array(
            $modelClass, $attribute, $field, $counter
        );
        return strtolower(implode("-", $data));
    }

    /**
     * Generate name for field
     * @param $field
     * @param $attribute
     * @param $modelClass
     * @param $counter
     * @return string
     */
    public static function formName($field, $attribute, $modelClass, $counter)
    {
        return $modelClass . "[" . $attribute . "][" . $field . "][" . $counter . "]";
    }

    /**
     * Generate parent items for page
     * @param null $model
     * @param array $params
     * @return string
     */
    public function bindParentItems($model = null, $params = [])
    {
        if (!isset($model)) {
            $model = new PagePage();
        }
        $viewPath = "@backend/modules/content/views/page-page/view";
        $attributes = (new PagePage())->getAttributes();
        $attributesData = [];
        foreach ($attributes as $attribute => $value) {
            $attributesData[$attribute] = [
                'id'   => self::formIdAttribute($attribute, $params['attribute'], $params['modelClass'], $params['counter']),
                'name' => self::formName($attribute, $params['attribute'], $params['modelClass'], $params['counter'])
            ];
        }
        return \Yii::$app->controller->renderPartial($viewPath, ArrayHelper::merge([
            'model'          => $model,
            'attributesData' => $attributesData,
        ], $params));
    }

    /**
     * Generate meta tag items for page
     * @param null $model
     * @param array $params
     * @return string
     */
    public function bindMetaItems($model = null, $params = [])
    {
        if (!isset($model)) {
            $model = new PageExtraMeta();
        }
        $viewPath = "@backend/modules/content/views/page-extra-meta/view";
        $attributes = (new PageExtraMeta())->getAttributes();
        $attributesData = [];
        foreach ($attributes as $attribute => $value) {
            $attributesData[$attribute] = [
                'id'   => self::formIdAttribute($attribute, $params['attribute'], $params['modelClass'], $params['counter']),
                'name' => self::formName($attribute, $params['attribute'], $params['modelClass'], $params['counter'])
            ];
        }
        return \Yii::$app->controller->renderPartial($viewPath, ArrayHelper::merge([
            'model'          => $model,
            'attributesData' => $attributesData,
        ], $params));
    }

    /**
     * Generate routes for page
     * @param null $model
     * @param array $params
     * @return string
     */
    public function bindRoutes($model = null, $params = [])
    {
        if (!isset($model)) {
            $model = new PageRoute();
        }
        $viewPath = "@backend/modules/content/views/page-route/view";
        $attributes = (new PageRoute())->getAttributes();
        $attributesData = [];
        $type = \Yii::$app->request->get('type', null);
        $defaultSelectedRoute = null;
        if (isset($type)) {
            /**
             * @var PageType $pageType
             */
            $pageType = PageType::getPageTypeByAlias($type);
            if (isset($pageType)) {
                $defaultSelectedRoute = $pageType->routeID;
            }
        }
        foreach ($attributes as $attribute => $value) {
            $attributesData[$attribute] = [
                'id'   => self::formIdAttribute($attribute, $params['attribute'], $params['modelClass'], $params['counter']),
                'name' => self::formName($attribute, $params['attribute'], $params['modelClass'], $params['counter'])
            ];
        }
        return \Yii::$app->controller->renderPartial($viewPath, ArrayHelper::merge([
            'model'                => $model,
            'attributesData'       => $attributesData,
            'defaultSelectedRoute' => $defaultSelectedRoute
        ], $params));
    }


}