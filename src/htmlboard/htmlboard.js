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

    jQuery.fn.loadBoard = function(pieces){

        for (var index in pieces){
	    var square = $(this).find('.' + pieces[index].location[0] + '.' + pieces[index].location[1]);
	    square.addClass(pieces[index].color);
	    square.addClass(pieces[index].type);
	}

    }

})(jQuery);
