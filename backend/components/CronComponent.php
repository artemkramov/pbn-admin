<?php

namespace backend\components;
use backend\models\Customer;
use backend\models\DateWeight;
use backend\models\Invoice;
use backend\models\InvoiceLine;
use backend\models\InvoiceSentQueue;
use backend\models\Novelty;
use backend\models\Template;
use common\components\Mailer;
use common\models\PreOrder;
use common\modules\i18n\Module;

/**
 * Class for handling and running of all crontab jobs
 * @author Artem Kramov
 * */
class CronComponent
{

    /**
     * Update exchange rate
     */
    public function crUpdateExchangeRate()
    {
        $api = new ExchangeRateApi();
        $api->run();
        return true;
    }

    /**
     * Send all queued novelties
     */
    public function crSendQueuedNovelties()
    {
        Novelty::sendQueuedNovelties();
        return true;
    }

    /**
     * Inform all users that the product is available now
     * @return bool
     */
    public function crSendPreOrders()
    {
        PreOrder::sendNotifications();
        return true;
    }

    /**
     * Update information about the cities, warehouses and streets
     * @return bool
     */
    public function crUpdateInfoNovaPoshta()
    {
        return NovaPoshtaApi2::updateDictionaries();
    }


}