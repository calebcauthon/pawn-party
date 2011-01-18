(function ($) {

    jQuery.fn.setupBoard = function () {
        for (var index = 0; index < 64; index++) {
            if (index < 8)
                $(this).append('<div class="A" />');
            else if (index >= 8 && index < 16)
                $(this).append('<div class="B" />');
            else if (index >= 16 && index < 24)
                $(this).append('<div class="C" />');
            else
                $(this).append('<div />');
        }
    };

})(jQuery);