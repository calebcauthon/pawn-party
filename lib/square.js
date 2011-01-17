function square() {}
square.prototype.piece;
square.prototype.has_piece = function() {
	return this.piece ? true : false;
}
square.prototype.set_piece = function(piece) {
	this.piece = piece;
}
square.prototype.draw = function(x, y, width, height) {
	var canvas = document.getElementById('canvas_element');
	var context = canvas.getContext('2d');
	var width_of_one_square = width;
	var height_of_one_square = height;
	
	context.fillStyle = '#FFF';
	context.strokeStyle = '#FFF';
	context.strokeRect(x,y,width_of_one_square, height_of_one_square);	
}