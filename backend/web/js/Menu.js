/**
 * Object for management of the menu item
 * @type {{init, event, updateMenu}}
 */
var Menu = (function () {

    /**
     * Menu types select
     * @type {string}
     */
    var selectMenuType = '#menu-menutypeid';

    /**
     * Menu items select
     * @type {string}
     */
    var selectMenu = '#menu-parentid';

    /**
     * Url for loading of menu items
     * @type {string}
     */
    var urlLoadMenu = '/ajax/load-menu-dropdown';

    return {
        /**
         * Init events
         */
        init: function () {
            this.event();
        },
        /**
         * Register events
         */
        event: function () {
            var self = this;

            $(document).ready(function () {

                $(selectMenuType).change(function () {
                    self.updateMenu($(this).val(), false);
                });

                self.updateMenu($(selectMenuType).val(), true);

            });

        },
        /**
         * Update menu by the given menu type
         * @param menuTypeID
         * @param isLoading
         */
        updateMenu: function (menuTypeID, isLoading) {
            App.sendAjax({
                url: urlLoadMenu,
                data: {
                    menuTypeID: menuTypeID,
                    websiteID: window.websiteID
                },
                success: function (items) {
                    App.hideAjaxloader();
                    $(selectMenu).find("option").remove();
                    App.pushSelect(selectMenu, items);
                    if (isLoading && typeof parentID != 'undefined') {
                        $(selectMenu).val(parentID);
                    }
                }
            }, false)
        }
    };

})();
Menu.init();