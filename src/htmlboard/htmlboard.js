(function ($) {

    jQuery.fn.setupBoard = function () {

        var columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

        for (column in columns) {
            for (var index = 1; index <= 8; index++) {
                var square = $('<div />');
                square.addClass(columns[column]);
                square.addClass(index + '');
                $(this).append(square);

                square.bind('click', function(){
            
                    var location = getCurrentLocation($(this));
                    var available_moves = $(location).data('availableMoves');

                     $(this).parent().children().removeClass('highlighted');

                     for (var mi in available_moves){
                     $('.' + available_moves[mi][0] + '.' + available_moves[mi][1]).addClass('highlighted');
                     }
                 });
            }
        }
    };

    function getCurrentLocation(selector){
        var classList = selector.attr('class').split(/\s+/);
        var result = '';
        $.each( classList, function(index, item){
            if (item.length == 1) {
                result = result + '.' + item;
            }
        });
        return result;
    }

    jQuery.fn.loadBoard = function(pieces){

        for (var index in pieces){
            var square = $(this).find('.' + pieces[index].location[0] + '.' + pieces[index].location[1]);
            square.addClass(pieces[index].color);
            square.addClass(pieces[index].type);
        }
    };

    jQuery.fn.setAvailableMoves = function(moves){
        for(var index in moves){
            var location = '.' + moves[index].location[0] + '.' + moves[index].location[1];
            $('' + location).data('availableMoves', moves[index].availableMoves);
        }
    };

})(jQuery);
