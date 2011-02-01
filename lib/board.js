function board() {
	this.width = 80;
	this.height = 80;
}
board.prototype.highlight_square = function(algebraic_notation) {
	var the_square = this.get_square(algebraic_notation);
	
	if(!the_square.original_color)
		the_square.original_color = the_square.color;
		
	the_square.color = 'rgb(5,10,199)';
	the_square.draw();
}
board.prototype.unhighlight_square = function(algebraic_notation) {
	var the_square = this.get_square(algebraic_notation);
	the_square.color = the_square.original_color;
	the_square.draw();
}
board.prototype.set_board_width = function(width) {
	this.width = width;
}
board.prototype.set_board_height = function(height) {
	this.height = height;
}
board.prototype.create_empty_chess_board = function() {
	var squares = [];
	var next_row_starts_white = true;
	var ranks = [8, 7, 6, 5, 4, 3, 2, 1];
	var files = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
	
	for(i = 1; i <= 64; i++)
	{
		if(i == 1)
			var next_row_top = 0;
		
		var a_square = new square();
		a_square.height = this.height / 8;
		a_square.width = this.width / 8;
		
		var white_color = 'rgb(10,10,10)';
		var black_color = 'rgb(200,200,200)';
		
		if((i-1) % 8 == 0 || i == 1)
		{
			if(i != 1)
				next_row_top = next_row_top + last_square.height;
				
			a_square.left = 0;
			
			if(next_row_starts_white)
				a_square.color = white_color;
			else
				a_square.color = black_color;
				
			next_row_starts_white = !next_row_starts_white;
		}
		else
		{
			a_square.left = last_square.left + last_square.width;
			if(last_square.color == white_color)
				a_square.color = black_color;
			else
				a_square.color = white_color;
		}
		
		if(i <= 8)
			a_square.top = 0;
		else
			a_square.top = next_row_top;
		
		var rank = ranks[Math.floor((i-1) / 8)];
		var file = files[(i-1) % 8];
		var algebraic_notation = "" + file + rank;
		a_square.algebraic_notation = algebraic_notation;
		a_square.rank = rank;
		a_square.file = file;
		
		if(this.context)
			a_square.set_context(this.context);
		
		squares.push(a_square);
		var last_square = a_square;
	}
	
	return squares;
}
board.prototype.set_pieces = function(pieces) {
	for(var i = 0; i < pieces.length; i++)
	{
		this.set_piece(pieces[i]);
	}
}
board.prototype.set_piece = function(chess_piece_data) {
	var piece = chess_piece_data.piece;
	var algebraic_notation = chess_piece_data.location;
	
	var this_square = this.get_square(algebraic_notation);
	this_square.set_piece(chess_piece_data);
}

board.prototype.draw = function() {
	for(var i = 0;i<this.squares.length;i++)
	{
		this.squares[i].draw();
	}
}
board.prototype.get_square = function(algebraic_notation) {
	var squares = this.squares;
	for(var i = 0; i < squares.length; i++)
	{
		if(squares[i].algebraic_notation == algebraic_notation)
			return squares[i];
	}
	
	throw "Couldnt find any square using "+algebraic_notation;
}
board.prototype.click = function(event_details) {
	var this_board = event_details.data.board;
	var left = event_details.offsetX;
	var top = event_details.offsetY;
	
	for(var i = 0; i < 64; i++)
	{
		var this_square = this_board.squares[i];
		if(left > this_square.left && left < (this_square.left + this_square.width))
		if(top > this_square.top && top < (this_square.top + this_square.width))
		{
			this_square.select();
			return;
		}
	}
}