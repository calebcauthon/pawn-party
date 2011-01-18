(function ($) {

    jQuery.fn.setupBoard = function () {

        var columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

        for (column in columns) {
            for (var index = 1; index <= 8; index++) {
                var square = $('<div />');
                square.addClass(columns[column]);
                square.addClass(index + '');
                $(this).append(square);
            }
        }
    };

})(jQuery);