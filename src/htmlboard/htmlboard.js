(function ($) {

    jQuery.fn.setupBoard = function () {

        var columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

        for (column in columns) {
            for (var index = 0; index < 8; index++) {
                $(this).append('<div class="' + columns[column] + '" />');
            }
        }

    };

})(jQuery);