(function ($) {

    jQuery.fn.setupBoard = function () {
        for (var index = 0; index < 64; index++)
            $(this).append('<div />');
    };

})(jQuery);