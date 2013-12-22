var squares = {}
squares.each_square = []
squares.add_square = function(square) {
	this.each_square.push(square);
}
squares.get_square = function(row, column) {
	for(var i = 0; i < this.each_square.length; i++)
	{
		var this_square = this.each_square[i];
		if(this_square.row == row && this_square.column == column)
			return this_square;
	}
	
	throw "couldnt find any square with row="+row+" and column="+column+"";
}
squares.get_piece_by_location = function(x, y) {
	for(var i = 0; i < this.each_square.length; i++)
	{
		var this_square = this.each_square[i];
		
		var left_boundary_condition = (this_square.get_upper_left_x_coordinate() < x);
		var top_boundary_condition = (this_square.get_upper_left_y_coordinate() < y);
		var bottom_boundary_condition = ((this_square.get_upper_left_y_coordinate() + this_square.height) > y);
		var right_boundary_condition = ((this_square.get_upper_left_x_coordinate() + this_square.width) > x);
		
		if(left_boundary_condition && top_boundary_condition && right_boundary_condition && bottom_boundary_condition)
			return this_square;
	}
	
	throw "couldnt find any square with x="+x+" and y="+y+"";
}
