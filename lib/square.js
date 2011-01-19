function square() {}
square.prototype.piece;
square.prototype.has_piece = function() {
	return this.piece ? true : false;
}
square.prototype.set_piece = function(piece) {
	this.piece = piece;
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
}
square.prototype.draw_image = function(image_path) {	
	var context = this.context;
	img = new Image();
	img.src = image_path;
	
	var left = this.left;
	var top = this.top;
	
	img.onload = function() {
		context.drawImage(img,left,top);
	}
}