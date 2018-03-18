<?php

namespace common\components;

use Yii;
use yii\web\Request;
use common\models\Lang;
use yii\helpers\Url;

/**
 * Class LangRequest
 * @package common\components
 */
class LangRequest extends Request
{

    /**
     * @var string
     */
    private $_langUrl;

    /**
     * @return string
     */
    public function getLangUrl()
    {
        if ($this->_langUrl === null) {
            $this->_langUrl = $this->getUrl();

            $urlList = explode('/', $this->_langUrl);

            $langUrl = isset($urlList[1]) ? $urlList[1] : null;

            Lang::setCurrent($langUrl);

            if ($langUrl !== null && $langUrl === Lang::getCurrent()->url &&
                strpos($this->_langUrl, Lang::getCurrent()->url) === 1
            ) {
                $this->_langUrl = substr($this->_langUrl, strlen(Lang::getCurrent()->url) + 1);
            }
        }



        return $this->_langUrl;
    }

    /**
     * @return string
     */
    protected function resolvePathInfo()
    {
        $pathInfo = $this->getLangUrl();

        if (($pos = strpos($pathInfo, '?')) !== false) {
            $pathInfo = substr($pathInfo, 0, $pos);
        }

        $pathInfo = urldecode($pathInfo);

        // try to encode in UTF8 if not so
        // http://w3.org/International/questions/qa-forms-utf-8.html
        if (!preg_match('%^(?:
            [\x09\x0A\x0D\x20-\x7E]              # ASCII
            | [\xC2-\xDF][\x80-\xBF]             # non-overlong 2-byte
            | \xE0[\xA0-\xBF][\x80-\xBF]         # excluding overlongs
            | [\xE1-\xEC\xEE\xEF][\x80-\xBF]{2}  # straight 3-byte
            | \xED[\x80-\x9F][\x80-\xBF]         # excluding surrogates
            | \xF0[\x90-\xBF][\x80-\xBF]{2}      # planes 1-3
            | [\xF1-\xF3][\x80-\xBF]{3}          # planes 4-15
            | \xF4[\x80-\x8F][\x80-\xBF]{2}      # plane 16
            )*$%xs', $pathInfo)
        ) {
            $pathInfo = utf8_encode($pathInfo);
        }

        $scriptUrl = $this->getScriptUrl();
        $baseUrl = $this->getBaseUrl();
        if (strpos($pathInfo, $scriptUrl) === 0) {
            $pathInfo = substr($pathInfo, strlen($scriptUrl));
        } elseif ($baseUrl === '' || strpos($pathInfo, $baseUrl) === 0) {
            $pathInfo = substr($pathInfo, strlen($baseUrl));
        } elseif (isset($_SERVER['PHP_SELF']) && strpos($_SERVER['PHP_SELF'], $scriptUrl) === 0) {
            $pathInfo = substr($_SERVER['PHP_SELF'], strlen($scriptUrl));
        } else {
            throw new InvalidConfigException('Unable to determine the path info of the current request.');
        }


        if (!empty($pathInfo) && $pathInfo[0] === '/') {
            $pathInfo = substr($pathInfo, 1);
        }

        return (string)$pathInfo;
    }
}