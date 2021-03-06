function board() {
	this.width = 80;
	this.height = 80;
}
board.prototype.highlight_available_moves_on_click = function() {
	this.select = this.highlight_available_moves;
}
board.prototype.highlight_available_moves = function(algebraic_notation) {
	var board_to_highlight = this;
	var fn = function(notations) {
		board_to_highlight.highlight_squares(notations);
	}
	this.get_available_moves(algebraic_notation, fn);
}
board.prototype.get_board_notation = function() {	
	var notations = [];
	if(this.squares)
		for(var i = 0; i < 64; i++)
		{
			var this_square = this.squares[i];
			if(this_square.has_piece())
				notations.push({
					"piece": this_square.piece.piece,
					"algebraic_notation": this_square.algebraic_notation
				});
		}
	
	return notations;
}
board.prototype.get_available_moves = function(algebraic_notation, fn) {
	var moves_url = '/get_available_moves';
	var data = {};
	data.notations = this.get_board_notation();
	
	data.algebraic_notation = algebraic_notation;
	
	console.log('getting available moves and sending: ', data);
	console.log($.post);
	$.post(moves_url, data, function(json) {
		var response = $.parseJSON(json);
		console.log(response);
		fn(response.notations);
	});
}
board.prototype.detect_click_events = function(canvas_element) {
	$(canvas_element).click({board: this}, this.click);	
}
board.prototype.make_square_highlightable = function(algebraic_notation) {
	var the_square = this.get_square(algebraic_notation);
	
	the_square.the_board = this;
	the_square.select = function() {
		this.the_board.highlight_square(this.algebraic_notation);
	}
}
board.prototype.highlight_squares = function(algebraic_notations) {
	for(var i = 0; i < algebraic_notations.length; i++)
	{
		this.highlight_square(algebraic_notations[i]);
	}
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
	var next_row_starts_white = false;
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
board.prototype.select = function(algebraic_notation) {
	
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
			this_board.select(this_square.algebraic_notation);
			this_square.select();
			return;
		}
	}
}