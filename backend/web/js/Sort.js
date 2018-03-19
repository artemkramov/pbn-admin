/**
 * Sort object for sorting and position management
 * @type {{init, event, loadData}}
 */
var Sort = (function () {

    /**
     * Container block of the tree
     * @type {string}
     */
    var container = "#tree1";

    /**
     * Url for async data uploading
     * @type {string}
     */
    var urlLoadMenuItems = 'ajax/load-menu-items';

    /**
     * Hidden input with the url for getting of the items
     * @type {string}
     */
    var inputUrlItems = '#url-load-items';

    /**
     * Form selector
     * @type {string}
     */
    var form = '.form-sort';

    return {
        /**
         * Init event
         */
        init: function () {
            this.event();
        },
        /**
         * Register all events
         */
        event: function () {
            var self = this;
            $(document).ready(function () {
                self.loadData();

                $(form).submit(function () {
                    var jsonTree = $(container).tree('toJson');
                    $(this).append($('<input />').attr('name', 'jsonTree').attr('type', 'hidden').val(jsonTree));
                    return true;
                });

            });
        },
        /**
         * Load tree data
         */
        loadData: function () {
            var urlLoadItems = urlLoadMenuItems;
            var url = window.siteUrl + urlLoadItems;
            if ($(inputUrlItems).length) {
                url = $(inputUrlItems).val();
            }
            App.sendAjax({
                url: url,
                success: function (data) {
                    App.hideAjaxloader();
                    $(container).tree({
                        data: data,
                        dragAndDrop: true,
                        autoOpen: true
                    });
                }
            }, true);
        }
    };

})();
Sort.init();