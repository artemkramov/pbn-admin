<?php

use yii\db\Migration;

class m180402_130648_emersonquidditch_site1 extends Migration
{
    private $websiteID = 7;

    public function init()
    {
        $request = new \common\components\LangRequest();
        $request->resolveDatabaseConnection($this->websiteID);
        $this->db = 'db2';
        parent::init();
    }

    public function safeUp()
    {

        /**
         * Insert menu types
         */
        $this->insert('{{%menu-type}}', [
            'id'        => null,
            'alias'     => 'header',
            'name'      => 'Header menu',
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $this->insert('{{%menu-type}}', [
            'id'        => null,
            'alias'     => 'footer',
            'name'      => 'Footer menu',
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);

        /**
         * Insert templates
         */
        $this->insert('{{%template}}', [
            'id'        => null,
            'alias'     => 'general-carcass',
            'name'      => 'General',
            'type'      => 'carcass',
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $templateCarcassID = Yii::$app->db2->getLastInsertID();
        $this->insert('{{%template}}', [
            'id'        => null,
            'alias'     => 'page',
            'name'      => 'Page',
            'type'      => 'inner',
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $this->insert('{{%template}}', [
            'id'        => null,
            'alias'     => 'post',
            'name'      => 'Post',
            'type'      => 'inner',
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $this->insert('{{%template}}', [
            'id'        => null,
            'alias'     => 'main-page',
            'name'      => 'Main page',
            'type'      => 'inner',
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $templateInnerID = Yii::$app->db2->getLastInsertID();

        /**
         * Insert page types
         */
        $this->insert('{{%page-type}}', [
            'id'        => null,
            'alias'     => 'page',
            'name'      => 'Page',
            'routeID'   => null,
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $pageTypeCommonID = Yii::$app->db2->getLastInsertID();
        $this->insert('{{%page-type}}', [
            'id'        => null,
            'alias'     => 'post',
            'name'      => 'Post',
            'routeID'   => null,
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $this->insert('{{%page-type}}', [
            'id'        => null,
            'alias'     => 'category',
            'name'      => 'Category',
            'routeID'   => null,
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $this->insert('{{%page-type}}', [
            'id'        => null,
            'alias'     => 'author',
            'name'      => 'Author',
            'routeID'   => null,
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $pageTypeAuthorID = Yii::$app->db2->getLastInsertID();

        /**
         * Insert routes
         */
        $this->insert('{{%route}}', [
            'id'        => null,
            'name'      => 'Post',
            'link'      => 'content/<:alias>',
            'priority'  => 1,
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $this->insert('{{%route}}', [
            'id'        => null,
            'name'      => 'Common',
            'link'      => '<:alias>',
            'priority'  => 5,
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $routeID = Yii::$app->db2->getLastInsertID();

        /**
         * Insert pagination
         */
        $this->insert('{{%pagination}}', [
            'id'        => null,
            'template'  => 'page/<:page>',
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);
        $this->insert('{{%pagination}}', [
            'id'        => null,
            'template'  => 'p=<:page>',
            'isDeleted' => 0,
            'websiteID' => $this->websiteID
        ]);

        /**
         * Insert default author
         */
        $this->insert('{{%page}}', [
            'id'                   => null,
            'image1'               => null,
            'image2'               => null,
            'image3'               => null,
            'datePublished'        => date('Y-m-d'),
            'dateCreated'          => null,
            'dateModified'         => null,
            'sort'                 => 0,
            'authorID'             => null,
            'seoPriority'          => 0.5,
            'pageTypeID'           => $pageTypeAuthorID,
            'ratingValue'          => null,
            'ratingCount'          => null,
            'isPaginationOn'       => 0,
            'paginationID'         => null,
            'paginationPerPage'    => null,
            'templateCarcassID'    => $templateCarcassID,
            'templateInnerID'      => $templateInnerID,
            'isVisibleSitemapXml'  => 0,
            'isVisibleSitemapHtml' => 0,
            'isEnabled'            => 1,
            'isMainPage'           => 0,
            'isDeleted'            => 0,
            'websiteID'            => $this->websiteID
        ]);
        $pageAuthorID = Yii::$app->db2->getLastInsertID();
        $this->insert('{{%page-language}}', [
            'id'               => null,
            'pageID'           => $pageAuthorID,
            'language'         => 'en',
            'title'            => 'Author',
            'description'      => '',
            'descriptionShort' => '',
            'seoTitle'         => 'Author',
            'seoDescription'   => '',
            'seoKeywords'      => ''
        ]);


        /**
         * Insert main page
         */
        $this->insert('{{%page}}', [
            'id'                   => null,
            'image1'               => null,
            'image2'               => null,
            'image3'               => null,
            'datePublished'        => date('Y-m-d'),
            'dateCreated'          => null,
            'dateModified'         => null,
            'sort'                 => 0,
            'authorID'             => null,
            'seoPriority'          => 0.5,
            'pageTypeID'           => $pageTypeCommonID,
            'ratingValue'          => null,
            'ratingCount'          => null,
            'isPaginationOn'       => 0,
            'paginationID'         => null,
            'paginationPerPage'    => null,
            'templateCarcassID'    => $templateCarcassID,
            'templateInnerID'      => $templateInnerID,
            'isVisibleSitemapXml'  => 0,
            'isVisibleSitemapHtml' => 0,
            'isEnabled'            => 1,
            'isMainPage'           => 1,
            'isDeleted'            => 0,
            'websiteID'            => $this->websiteID
        ]);
        $pageMainID = Yii::$app->db2->getLastInsertID();
        $this->insert('{{%page-language}}', [
            'id'               => null,
            'pageID'           => $pageMainID,
            'language'         => 'en',
            'title'            => 'Home',
            'description'      => '',
            'descriptionShort' => '',
            'seoTitle'         => 'Home',
            'seoDescription'   => '',
            'seoKeywords'      => ''
        ]);
        $this->insert('{{%page-route}}', [
            'pageID'  => $pageMainID,
            'routeID' => $routeID,
            'alias'   => 'main'
        ]);
    }

    public function safeDown()
    {
//        $this->delete('{{%menu-type}}', [
//            'websiteID' => $this->websiteID
//        ]);
//        $this->delete('{{%page}}', [
//            'websiteID' => $this->websiteID
//        ]);
//        $this->delete('{{%template}}', [
//            'websiteID' => $this->websiteID
//        ]);
//        $this->delete('{{%route}}', [
//            'websiteID' => $this->websiteID
//        ]);
//        $this->delete('{{%pagination}}', [
//            'websiteID' => $this->websiteID
//        ]);
//        $this->delete('{{%page-type}}', [
//            'websiteID' => $this->websiteID
//        ]);

        echo "m180328_071132_site_common is reverted.\n";

        return true;
    }
}
