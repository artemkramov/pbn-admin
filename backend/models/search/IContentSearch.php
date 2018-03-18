<?php

namespace backend\models\search;

/**
 * Interface IContentSearch
 * @package backend\models\search
 */
interface IContentSearch
{

    /**
     * @param array $queryParams
     * @param int $websiteID
     * @return mixed
     */
    public function search($queryParams, $websiteID);

}