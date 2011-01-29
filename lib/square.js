function square() {}
square.prototype.get_associated_image = function(piece_name) {
	var base_image_path = '/images/chesspieces/';
	switch(piece_name)
	{
		case 'white pawn':
			var filename = 'white-pawn.png';
			break;
		case 'white queen':
			var filename = 'white-queen.png';
			break;
		case 'white rook':
			var filename = 'white-rook.png';
			break;
		case 'white knight':
			var filename = 'white-knight.png';
			break;
		case 'white king':
			var filename = 'white-king.png';
			break;
		case 'white bishop':
			var filename = 'white-bishop.png';
			break;
			
		case 'black pawn':
			var filename = 'black-pawn.png';
			break;
		case 'black queen':
			var filename = 'black-queen.png';
			break;
		case 'black rook':
			var filename = 'black-rook.png';
			break;
		case 'black knight':
			var filename = 'black-knight.png';
			break;
		case 'black king':
			var filename = 'black-king.png';
			break;
		case 'black bishop':
			var filename = 'black-bishop.png';
			break;
		
		default: 			
			var filename = 'white-queen.png';
	}

	return base_image_path + filename;
}
square.prototype.select = function() {
	var algebraic_notation = this.algebraic_notation;
	console.log(algebraic_notation, 'was clicked');
}
square.prototype.piece;
square.prototype.has_piece = function() {
	return this.piece ? true : false;
}
square.prototype.set_piece = function(chess_piece) {
	this.piece = chess_piece;
	this.piece.image = this.get_associated_image(chess_piece.piece);
}
square.prototype.color;
square.prototype.context;
square.prototype.set_context = function(context) {
	this.context = context;
}
square.prototype.draw = function() {
	if(!this.context)
		throw "No IOC context has been set";
		
	var context = this.context;
	var width_of_one_square = this.width;
	var height_of_one_square = this.height;
	
	if(this.color)
		context.fillStyle = this.color;
	else
		context.fillStyle = 'rgb(6,6,6)';
		
	context.fillRect(this.left, this.top, width_of_one_square, height_of_one_square);
	
	if(this.has_piece())
		this.draw_image(this.piece.image);
}
square.prototype.draw_image = function(image_path) {	
	var context = this.context;
	img = new Image();
	img.src = image_path;
	
	var left = this.left;
	var top = this.top;
	
	img.onload = function() {
		context.drawImage(this,left,top);
	}
}