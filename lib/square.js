function square() {}
square.prototype.piece;
square.prototype.has_piece = function() {
	return this.piece ? true : false;
}
square.prototype.set_piece = function(piece) {
	this.piece = piece;
}
square.prototype.context;
square.prototype.set_context = function(context) {
	this.context = context;
}
square.prototype.draw = function(x, y) {
	
	if(!this.context)
		throw "No IOC context has been set";
		
	var context = this.context;
	var width_of_one_square = this.width;
	var height_of_one_square = this.height;
	
	context.fillStyle = '#FFF';
	context.strokeStyle = '#FFF';
	context.strokeRect(x,y,width_of_one_square, height_of_one_square);	
}