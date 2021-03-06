<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SiteHelper
 *
 * @author admin
 */

namespace backend\components;

use common\models\Bean;
use common\models\Lang;
use common\models\User;
use common\modules\i18n\Module;
use yii\db\Query;
use yii\helpers\ArrayHelper;
use yii\helpers\BaseUrl;
use backend\models\Job;
use yii\helpers\Html;
use yii\helpers\Url;

/**
 * Class for common usage in the application
 * */
class SiteHelper extends \yii\base\Component
{

    const WEEK_DELIMITER = ",";

    /**
     * @param array $actions
     * @return string
     */
    public static function getListTemplate($actions = [])
    {
        foreach ($actions as $key => $action) {
            $url = [
                $action
            ];
            if (!self::checkActionPermission($url)) {
                unset($actions[$key]);
            }
//            $actions[$key] = $action;
        }
        $actions = array_map(function ($item) {
            return "{" . $item . "}";
        }, $actions);
        return implode(' ', $actions);
    }

    /**
     * @return string
     */
    public static function generateUUID()
    {
        return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            mt_rand(0, 0xffff), mt_rand(0, 0xffff),
            mt_rand(0, 0xffff),
            mt_rand(0, 0x0fff) | 0x4000,
            mt_rand(0, 0x3fff) | 0x8000,
            mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }

    public static function getListButtons()
    {
        return [
            'view'   => function ($url, $model) {
                $icon = "eye-open";
                $url = Url::to(self::formUrlForWebsite([AccessHelper::formPrimaryUrl('view'), 'id' => $model->id]));
                return Html::a('<span class="glyphicon glyphicon-' . $icon . '"></span> ', $url, [
                    'title' => \Yii::t('yii', 'View')
                ]);
            },
            'update' => function ($url, $model) {
                $icon = "pencil";
                $url = Url::to(self::formUrlForWebsite([AccessHelper::formPrimaryUrl('update'), 'id' => $model->id]));
                return Html::a('<span class="glyphicon glyphicon-' . $icon . '"></span> ', $url, [
                    'title' => \Yii::t('yii', 'Update')
                ]);
            },
            'delete' => function ($url, $model) {
                $icon = "trash";
                $url = Url::to(self::formUrlForWebsite([AccessHelper::formPrimaryUrl('delete'), 'id' => $model->id]));
                return Html::a('<span class="glyphicon glyphicon-' . $icon . '"></span> ', $url, [
                    'title'        => \Yii::t('yii', 'Delete'),
                    'data-confirm' => \Yii::t('yii', 'Are you sure you want to delete this item?'),
                    'data-method'  => 'post',
                    'data-pjax'    => 0,
                    'aria-label'   => \Yii::t('yii', 'Delete'),
                ]);
            },
            'sort'   => function ($url, $model) {
                $icon = "sort";
                $url = Url::to(self::formUrlForWebsite([AccessHelper::formPrimaryUrl('sort'), 'id' => $model->id]));
                return Html::a('<span class="glyphicon glyphicon-' . $icon . '"></span> ', $url, [
                    'title' => 'Sort'
                ]);
            },
        ];
    }

    /**
     * Checking the permission for user by action
     * @param array $url
     * @return bool
     */
    public static function checkActionPermission($url = [])
    {
        $path = self::removeLangFromPath(Url::to($url));
        $route = [
            $path
        ];
        return SiteHelper::checkRoutePermission($route);
    }

    /**
     * Remove language slug from the URL
     * @param string $path - URL
     * @return string
     */
    public static function removeLangFromPath($path = '')
    {
        $path = str_replace(\Yii::$app->request->hostInfo, '', $path);
        $parts = array_slice(explode('/', $path), 2);
        return "/" . implode('/', $parts);
    }

    /**
     * @param $route
     * @return bool
     */
    public static function checkRoutePermission($route)
    {
        $route[0] = substr($route[0], 1, strlen($route[0]));

        $params = array($route[0], array());
        $t = self::checkPermission($params);
        return $t;
    }

    /**
     * Check if user has an access to this route
     * @param $route
     * @return bool
     */
    public static function checkPermission($route)
    {
        //$route[0] - is the route, $route[1] - is the associated parameters


        $routePathTmp = explode('/', $route[0]);
        $routeVariant = array_shift($routePathTmp);


        if (\Yii::$app->user->can($routeVariant, $route[1])) {
            return true;
        }

        foreach ($routePathTmp as $routePart) {
            $routeVariant .= '/' . $routePart;
            if (\Yii::$app->user->can($routeVariant, $route[1]))
                return true;
        }
        return false;
    }

    /**
     * Method is used to filter data in the search list
     * @param $query
     */
    public static function filterByAuthor($query)
    {
        $current_user = \Yii::$app->user;
        $roles = \Yii::$app->authManager->getRolesByUser($current_user->id);
        if (array_key_exists('customer', $roles)) {
            $customer = Customer::find()->where(['user_id' => $current_user->id])->one();
            $query->andWhere(['customer_id' => $customer->id]);
        }
    }

    /**
     * @return bool
     */
    public static function allowMassupdate()
    {
        return User::isAdmin() || \Yii::$app->user->can('invoices/invoices/mass-update');
    }

    /**
     * @param $value
     * @return string
     */
    public static function getCheckboxSign($value)
    {
        return !empty($value) ? Module::t('Yes') : Module::t('No');
    }

    /**
     * @return array
     */
    public static function getCheckboxDropdown()
    {
        return [
            '' => '',
            0  => Module::t('No'),
            1  => Module::t('Yes')
        ];
    }

    /**
     * @param $collection
     * @param $property
     * @param string $nameProperty
     * @return array
     */
    public static function buildTreeArrayFromCollection($collection, $property, $nameProperty = '')
    {
        $data = [];
        foreach ($collection as $item) {
            /**
             * @var Bean $item
             */
            $attributeData = $item->attributes;
            foreach ($item->getMultiLanguageFields() as $field) {
                $attributeData[$field] = $item->{$field};
            }
            foreach ($attributeData as $field => $value) {
                if ($field == $nameProperty) {
                    $attributeData['name'] = $value;
                }
            }
            if (method_exists($item, 'getUrl')) {
                $attributeData['url'] = $item->getUrl();
            }
            $data[] = $attributeData;
        }
        return self::buildTreeArray($data, $property);
    }

    /**
     * @param $items
     * @param string $property
     * @param null $parentID
     * @return array
     */
    public static function buildTreeArray($items, $property = 'name', $parentID = null)
    {
        $branch = [];
        foreach ($items as $item) {
            if (!is_array($item)) {
                $item = (array)$item;
            }
            if ($item['parentID'] == $parentID) {
                $children = self::buildTreeArray($items, $property, $item[$property]);
                if ($children) {
                    $item['children'] = $children;
                }
                $branch[] = $item;
            }
        }
        return $branch;
    }

    /**
     * @param $items
     * @param $propertyKey
     * @param $propertyValue
     * @param int $level
     * @return array
     */
    public static function buildTreeDropdown($items, $propertyKey, $propertyValue, $level = 0)
    {
        $collection = ['' => ''];
        foreach ($items as $item) {
            $collection[$item[$propertyKey]] = str_repeat('--', $level) . $item[$propertyValue];
            if (array_key_exists('children', $item) && !empty($item['children'])) {
                $collection = ArrayHelper::merge($collection, self::buildTreeDropdown($item['children'], $propertyKey, $propertyValue, $level + 1));
            }
        }
        return $collection;
    }

    /**
     * Method for building left menu
     * @return array|mixed
     */
    public function buildMenu()
    {
        $accessHelper = new AccessHelper();
        $isContentManager = User::isContentManager();
        $menu_items = [
            ['label' => 'Menu', 'options' => ['class' => 'header']],
            ['label' => 'Blog', 'icon' => 'fa fa-pencil-square-o', 'url' => '#',
             'items' => [
                 ['label' => 'Posts', 'url' => ['/content/pages/index', 'type' => 'post'], 'icon' => 'fa fa-bars'],
                 ['label'   => 'Authors', 'url' => ['/content/pages/index', 'type' => 'author'], 'icon' => 'fa fa-address-book-o',
                  'visible' => !$isContentManager],
                 ['label'   => 'Categories', 'url' => ['/content/pages/index', 'type' => 'category'], 'icon' => 'fa fa-circle',
                  'visible' => !$isContentManager]
             ]
            ],
            ['label' => 'Content', 'icon' => 'fa fa-list', 'url' => '#',
             'items' => [
                 ['label' => 'Templates', 'url' => ['/content/templates/index'], 'icon' => 'fa fa-columns'],
                 ['label' => 'Routes', 'url' => ['/content/routes/index'], 'icon' => 'fa fa-circle'],
                 ['label' => 'Pagination', 'url' => ['/content/paginations/index'], 'icon' => 'fa fa-circle'],
                 ['label' => 'Page types', 'url' => ['/content/page-types/index'], 'icon' => 'fa fa-circle'],
                 ['label' => 'Menu types', 'url' => ['/content/menu-types/index'], 'icon' => 'fa fa-circle'],
                 ['label' => 'Menu', 'url' => ['/content/menus/index'], 'icon' => 'fa fa-circle'],
                 ['label'   => 'Pages', 'url' => ['/content/pages/index', 'type' => 'page'], 'icon' => 'fa fa-book',
                  'visible' => !$isContentManager]
             ]
            ],
            ['label' => 'Users', 'icon' => 'fa fa-users', 'url' => '#',
             'items' => [
                 ['label' => 'Users', 'icon' => 'fa fa-user', 'url' => ['/users/users/index']],
                 ['label' => 'Permissions', 'icon' => 'fa fa-circle', 'url' => ['/permit/access/permission']],
                 ['label' => 'Roles', 'icon' => 'fa fa-circle', 'url' => ['/permit/access/role']],
             ]
            ],
            ['label' => 'Login', 'url' => ['site/login'], 'visible' => \Yii::$app->user->isGuest],
            ['label' => 'Settings', 'icon' => 'fa fa-cog', 'url' => '#',
             'items' => [
                 ['label' => 'Websites', 'url' => ['/settings/websites/index'], 'icon' => 'fa fa-globe']
             ]
            ],
        ];

        foreach ($menu_items as $key => $item) {
            if (array_key_exists('items', $item)) {
                $menu_items[$key]['items'] = $this->checkMenuListPermission($item['items']);
            }
            if (array_key_exists('url', $item) && $item['url'] == '#') {
                $visible = false;
                foreach ($menu_items[$key]['items'] as $subkey => $subitem) {
                    if ($subitem['visible']) {
                        $visible = true;
                        //break;
                    }
                    $item['items'][$subkey] = $subitem;
                }
                $item['visible'] = $visible;
                $menu_items[$key] = $item;
            }
        }
        $menu_items = $this->checkMenuListPermission($menu_items);
        return $menu_items;
    }

    /**
     * @param $menuItems
     * @return mixed
     */
    public function checkMenuListPermission($menuItems)
    {
        foreach ($menuItems as $key => $item) {
            if (array_key_exists('url', $item) && !array_key_exists('visible', $item) && $item['url'] !== "#") {
                $item['visible'] = self::checkRoutePermission($item['url']);
                $menuItems[$key] = $item;
            }
        }
        return $menuItems;
    }

    /**
     * @param $url
     * @return mixed
     */
    public static function formUrlForWebsite($url)
    {
        $websiteID = \Yii::$app->request->websiteID;
        if (isset($websiteID)) {
            $url['websiteID'] = $websiteID;
        }
        $type = \Yii::$app->request->get('type', null);
        if (isset($type)) {
            $url['type'] = $type;
        }
        return $url;
    }

    /**
     * @param $str
     * @return string
     */
    public static function translit($str)
    {
        $tr = array("Ї" => "I", "Є" => "E", "І" => "I", "ї" => "i", "є" => "e", "і" => "i", " " => "-", "," => "", "." => "", "`" => "", "(" => "", ")" => "", "'" => "-", "А" => "A", "Б" => "B", "В" => "V", "Г" => "G", "Д" => "D", "Е" => "E", "Ё" => "E", "Ж" => "J", "З" => "z", "И" => "I", "Й" => "Y", "К" => "K", "Л" => "L", "М" => "M", "Н" => "N", "О" => "O", "П" => "P", "Р" => "R", "С" => "S", "Т" => "T", "У" => "U", "Ф" => "F", "Х" => "H", "Ц" => "C", "Ч" => "CH", "Ш" => "SH", "Щ" => "SC", "Ъ" => "", "Ы" => "Y", "Ь" => "", "Э" => "E", "Ю" => "U", "Я" => "YA", "а" => "a", "б" => "b", "в" => "v", "г" => "g", "д" => "d", "е" => "e", "ё" => "e", "ж" => "j", "з" => "z", "и" => "i", "й" => "y", "к" => "k", "л" => "l", "м" => "m", "н" => "n", "о" => "o", "п" => "p", "р" => "r", "с" => "s", "т" => "t", "у" => "u", "ф" => "f", "х" => "h", "ц" => "c", "ч" => "ch", "ш" => "sh", "щ" => "sc", "ъ" => "y", "ы" => "y", "ь" => "", "э" => "e", "ю" => "u", "я" => "ya");
        return strtr(trim($str), $tr);
    }

}
