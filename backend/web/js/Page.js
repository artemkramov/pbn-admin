var Page = (function () {

    var checkboxPagination = '#page-ispaginationon';

    var rowPagination = '#pagination-row';

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

                $(document).on('change', checkboxPagination, function () {
                    if ($(this).is(':checked')) {
                        $(rowPagination).removeClass('hidden');
                    }
                    else {
                        $(rowPagination).addClass('hidden');
                    }
                });

            });

        }
    };

})();
Page.init();