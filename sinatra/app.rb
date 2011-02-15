require 'sinatra'

class ChessPiece
	attr_accessor :location
	attr_accessor :piece
	
	def to_json
		"{\"location\": \"#{location}\", \"piece\": \"#{piece}\"}"
	end
end

class Pieces < Array
	def to_json
		output = "["
		
		is_first = true
		self.each do |thing|
			this_json = thing.to_json
			
			unless(is_first)
				output += ','
			end
			
			output += this_json
			
			is_first = false
		end
		
		output += "]"
		output
	end
end

class ChessBoard
	def initialize
		@pieces = Array.new
	end		
	def set_piece(piece, algebraic_notation)		
		@pieces.push({:piece => piece, :algebraic_notation => algebraic_notation})
	end	
	def pieces 
		return @pieces
	end
	def has_white_piece(algebraic_notation)
		@pieces.each do |this_piece|
			if(this_piece[:piece] =~ /white/)				
				if(this_piece[:algebraic_notation] == algebraic_notation)
					return true
				end
			end
		end
		return false
	end	
	def has_colored_piece(color, algebraic_notation)
		if(color == :white)
			return self.has_white_piece(algebraic_notation)
		else
			return self.has_black_piece(algebraic_notation)
		end
	end	
	def has_black_piece(algebraic_notation)
		@pieces.each do |this_piece|
			if(this_piece[:piece] =~ /black/)				
				if(this_piece[:algebraic_notation] == algebraic_notation)
					return true
				end
			end
		end
		return false		
	end
	def move_within_file(algebraic_notation, direction, amount) 
		file = algebraic_notation[0,1]
		rank = algebraic_notation[1,1]
		
		if(direction == :down)
			amount = amount * -1
		end
		
		destination_file = file
		destination_rank = rank.to_i + amount
		
		destination = "#{destination_file}#{destination_rank}"
		destination
	end
	def move_diagonally_right(algebraic_notation, direction, amount) 
		file = algebraic_notation[0,1]
		rank = algebraic_notation[1,1]
		
		if(direction == :down)
			amount = amount * -1
		end
		
		destination_file = (file[0] + 1).chr
		destination_rank = rank.to_i + amount

		destination = "#{destination_file}#{destination_rank}"
		destination		
	end	
	def move_diagonally_left(algebraic_notation, direction, amount) 
		file = algebraic_notation[0,1]
		rank = algebraic_notation[1,1]
		
		if(direction == :down)
			amount = amount * -1
		end
		
		destination_file = (file[0] - 1).chr
		destination_rank = rank.to_i + amount

		destination = "#{destination_file}#{destination_rank}"
		destination		
	end
	def move_within_rank(algebraic_notation, amount)
		file = algebraic_notation[0,1]
		rank = algebraic_notation[1,1]
		
		destination_file = (file[0] + amount).chr
		destination_rank = rank

		destination = "#{destination_file}#{destination_rank}"
		destination	
	end
	def get_available_moves(piece, algebraic_notation)
		available_moves = Array.new
		
		rank = algebraic_notation[1,1]
			
		if(piece =~ /white/)
			if(rank.to_i == 2)
				pawn_is_on_home_row = true
			end
			color = :white
			opposing_color = :black
			direction = :up
		else
			if(rank.to_i == 7)
				pawn_is_on_home_row = true
			end
			color = :black
			opposing_color = :white
			direction = :down
		end
		if(piece =~ /queen/)
			
			keep_moving_left = true
			current_position = algebraic_notation
			while(keep_moving_left)
				move_left_one_notation = self.move_within_rank(current_position, -1)
				unless(self.has_colored_piece(color, move_left_one_notation))
					available_moves.push(move_left_one_notation);
				end
				
				current_position = move_left_one_notation
				if(self.has_colored_piece(color, move_left_one_notation))
					keep_moving_left = false
				elsif(self.has_colored_piece(opposing_color, move_left_one_notation))
					keep_moving_left = false
				elsif(move_left_one_notation[0,1].to_s == 'a')
					keep_moving_left = false
				end
			end
			
			keep_moving_right = true
			current_position = algebraic_notation
			while(keep_moving_right)
				move_right_one_notation = self.move_within_rank(current_position, 1)
				unless(self.has_colored_piece(color, move_right_one_notation))
					available_moves.push(move_right_one_notation);
				end
				
				current_position = move_right_one_notation
				if(self.has_colored_piece(color, move_right_one_notation))
					keep_moving_right = false
				elsif(self.has_colored_piece(opposing_color, move_right_one_notation))
					keep_moving_right = false
				elsif(move_right_one_notation[0,1].to_s == 'h')
					keep_moving_right = false
				end
			end
			
			
			
			keep_moving_backward = true
			current_position = algebraic_notation
			
			if(current_position[1,1].to_i == 8 && direction == :down)
				keep_moving_backward = false
			elsif(current_position[1,1].to_i == 1 && direction == :up)
				keep_moving_backward = false
			end
			
			while(keep_moving_backward)
				move_back_one_notation = self.move_within_file(current_position, direction, -1)
								
				unless(self.has_colored_piece(color, move_back_one_notation))					
					available_moves.push(move_back_one_notation);
				end
				
				current_position = move_back_one_notation
				
				if(self.has_colored_piece(color, move_back_one_notation))
					keep_moving_backward = false
				elsif(self.has_colored_piece(opposing_color, move_back_one_notation))
					keep_moving_backward = false
				end

				if(current_position[1,1].to_i == 8 && direction == :down)
					keep_moving_backward = false
				elsif(current_position[1,1].to_i == 1 && direction == :up)
					keep_moving_backward = false
				end
			end
			
			keep_moving_forward = true
			current_position = algebraic_notation
			while(keep_moving_forward)
				move_up_one_notation = self.move_within_file(current_position, direction, 1)
				unless(self.has_colored_piece(color, move_up_one_notation))
					available_moves.push(move_up_one_notation);
				end
				
				current_position = move_up_one_notation
				if(self.has_colored_piece(color, move_up_one_notation))
					keep_moving_forward = false
				elsif(self.has_colored_piece(opposing_color, move_up_one_notation))
					keep_moving_forward = false
				elsif(self.move_within_file(current_position, direction, 1)[1,1].to_i == 0)
					keep_moving_forward = false
				end
			end
			
			keep_moving_diagonally_right = true
			current_position = algebraic_notation
			while(keep_moving_diagonally_right)
				move_up_diagonally_right_notation = self.move_diagonally_right(current_position, direction, 1)
				unless(self.has_colored_piece(color, move_up_diagonally_right_notation))
					available_moves.push(move_up_diagonally_right_notation);
				end
				
				current_position = move_up_diagonally_right_notation
				if(self.has_colored_piece(color, move_up_diagonally_right_notation))
					keep_moving_diagonally_right = false
				elsif(self.has_colored_piece(opposing_color, move_up_diagonally_right_notation))
					keep_moving_diagonally_right = false
				elsif(move_up_diagonally_right_notation[0,1].to_s == 'h')
					keep_moving_diagonally_right = false
				end	
			end
			
			keep_moving_diagonally_left = true
			current_position = algebraic_notation
			while(keep_moving_diagonally_left)
				move_up_diagonally_left_notation = self.move_diagonally_left(current_position, direction, 1)
				unless(self.has_colored_piece(color, move_up_diagonally_left_notation))
					available_moves.push(move_up_diagonally_left_notation);
				end
				
				current_position = move_up_diagonally_left_notation
				if(self.has_colored_piece(color, move_up_diagonally_left_notation))
					keep_moving_diagonally_left = false
				elsif(self.has_colored_piece(opposing_color, move_up_diagonally_left_notation))
					keep_moving_diagonally_left = false
				elsif(move_up_diagonally_left_notation[0,1].to_s == 'a')
					keep_moving_diagonally_left = false
				end	
			end
			
			
			keep_moving_diagonally_back_right = true
			current_position = algebraic_notation
			
			if(current_position[1,1].to_i == 8 && direction == :down)
				keep_moving_diagonally_back_right = false
			elsif(current_position[1,1].to_i == 1 && direction == :up)
				keep_moving_diagonally_back_right = false
			elsif(current_position[0,1].to_s == 'h')
				keep_moving_diagonally_back_right = false			
			end
			
			while(keep_moving_diagonally_back_right)
				move_back_diagonally_right_notation = self.move_diagonally_right(current_position, direction, -1)
				unless(self.has_colored_piece(color, move_back_diagonally_right_notation))
					available_moves.push(move_back_diagonally_right_notation);
				end
				
				current_position = move_back_diagonally_right_notation
				if(self.has_colored_piece(color, move_back_diagonally_right_notation))
					keep_moving_diagonally_back_right = false
				elsif(self.has_colored_piece(opposing_color, move_back_diagonally_right_notation))
					keep_moving_diagonally_back_right = false
				end
				
				if(current_position[1,1].to_i == 8 && direction == :down)
					keep_moving_diagonally_back_right = false
				elsif(current_position[1,1].to_i == 1 && direction == :up)
					keep_moving_diagonally_back_right = false
				elsif(current_position[0,1].to_s == 'a')
					keep_moving_diagonally_back_right = false			
				end
			end
			
			keep_moving_diagonally_back_left = true
			current_position = algebraic_notation
			
			if(current_position[1,1].to_i == 8 && direction == :down)
				keep_moving_diagonally_back_left = false
			elsif(current_position[1,1].to_i == 1 && direction == :up)
				keep_moving_diagonally_back_left = false
			elsif(current_position[0,1].to_s == 'a')
				keep_moving_diagonally_back_left = false			
			end
			
			while(keep_moving_diagonally_back_left)
				move_back_diagonally_left_notation = self.move_diagonally_left(current_position, direction, -1)
				unless(self.has_colored_piece(color, move_back_diagonally_left_notation))
					available_moves.push(move_back_diagonally_left_notation);
				end
				
				current_position = move_back_diagonally_left_notation
				if(self.has_colored_piece(color, move_back_diagonally_left_notation))
					keep_moving_diagonally_back_left = false
				elsif(self.has_colored_piece(opposing_color, move_back_diagonally_left_notation))
					keep_moving_diagonally_back_left = false
				end
				
				if(current_position[1,1].to_i == 8 && direction == :down)
					keep_moving_diagonally_back_left = false
				elsif(current_position[1,1].to_i == 1 && direction == :up)
					keep_moving_diagonally_back_left = false
				elsif(current_position[0,1].to_s == 'a')
					keep_moving_diagonally_back_left = false			
				end
			end
		end
		if(piece =~ /knight/)
			move_up_one_notation = self.move_within_file(algebraic_notation, direction, 1)
			
			move_up_two_and_right_one = self.move_diagonally_right(move_up_one_notation, direction, 1)
			unless(self.has_colored_piece(color, move_up_two_and_right_one))
				available_moves.push(move_up_two_and_right_one);
			end			
			
			move_up_two_and_left_one = self.move_diagonally_left(move_up_one_notation, direction, 1)
			unless(self.has_colored_piece(color, move_up_two_and_left_one))
				available_moves.push(move_up_two_and_left_one);
			end	
			
			move_down_one_notation = self.move_within_file(algebraic_notation, direction, -1)
			move_down_two_and_right_one = self.move_diagonally_right(move_down_one_notation, direction, -1)
			unless(self.has_colored_piece(color, move_down_two_and_right_one))
				available_moves.push(move_down_two_and_right_one);
			end	
			
			move_down_one_notation = self.move_within_file(algebraic_notation, direction, -1)
			move_down_two_and_left_one = self.move_diagonally_left(move_down_one_notation, direction, -1)
			unless(self.has_colored_piece(color, move_down_two_and_left_one))
				available_moves.push(move_down_two_and_left_one);
			end
			
			move_up_one_and_right_two_notation = self.move_within_rank(move_up_one_notation, 2)
			unless(self.has_colored_piece(color, move_up_one_and_right_two_notation))
				available_moves.push(move_up_one_and_right_two_notation);
			end
			
			move_up_one_and_left_two_notation = self.move_within_rank(move_up_one_notation, -2)
			unless(self.has_colored_piece(color, move_up_one_and_left_two_notation))
				available_moves.push(move_up_one_and_left_two_notation);
			end
			
			move_down_one_and_right_two_notation = self.move_within_rank(move_down_one_notation, 2)
			unless(self.has_colored_piece(color, move_down_one_and_right_two_notation))
				available_moves.push(move_down_one_and_right_two_notation);
			end
			
			move_down_one_and_left_two_notation = self.move_within_rank(move_down_one_notation, -2)
			unless(self.has_colored_piece(color, move_down_one_and_left_two_notation))
				available_moves.push(move_down_one_and_left_two_notation);
			end
		end		
		if(piece =~ /pawn/)		
			
			move_up_one_notation = self.move_within_file(algebraic_notation, direction, 1)
			unless(self.has_colored_piece(color, move_up_one_notation))
				available_moves.push(move_up_one_notation);
			end
		
			capture_right_notation = self.move_diagonally_right(algebraic_notation, direction, 1)
			if(self.has_colored_piece(opposing_color, capture_right_notation))			
				available_moves.push(capture_right_notation)
			end
		
			if(pawn_is_on_home_row)
				move_up_two_notation = self.move_within_file(algebraic_notation, direction, 2)
				unless(self.has_colored_piece(color, move_up_two_notation) || self.has_colored_piece(color, move_up_one_notation))
					available_moves.push(move_up_two_notation);										
				end
			end
		end
		
		available_moves
	end
	def get_starting_board
		all_pieces = Pieces.new
		
		white_king = ChessPiece.new
		white_king.location = 'e8'
		white_king.piece = 'white king'
		all_pieces.push(white_king)
		
		white_queen = ChessPiece.new
		white_queen.location = 'd8'
		white_queen.piece = 'white queen'
		all_pieces.push(white_queen)
		
		white_knight = ChessPiece.new
		white_knight.location = 'b8'
		white_knight.piece = 'white knight'
		all_pieces.push(white_knight)
		
		white_knight = ChessPiece.new
		white_knight.location = 'g8'
		white_knight.piece = 'white knight'
		all_pieces.push(white_knight)
		
		white_rook = ChessPiece.new
		white_rook.location = 'a8'
		white_rook.piece = 'white rook'
		all_pieces.push(white_rook)
		
		white_rook = ChessPiece.new
		white_rook.location = 'h8'
		white_rook.piece = 'white rook'
		all_pieces.push(white_rook)
		
		white_bishop = ChessPiece.new
		white_bishop.location = 'c8'
		white_bishop.piece = 'white bishop'
		all_pieces.push(white_bishop)
		
		white_bishop = ChessPiece.new
		white_bishop.location = 'f8'
		white_bishop.piece = 'white bishop'
		all_pieces.push(white_bishop)
		
		black_king = ChessPiece.new
		black_king.location = 'e1'
		black_king.piece = 'black king'
		all_pieces.push(black_king)
		
		black_queen = ChessPiece.new
		black_queen.location = 'd1'
		black_queen.piece = 'black queen'
		all_pieces.push(black_queen)
		
		black_knight = ChessPiece.new
		black_knight.location = 'b1'
		black_knight.piece = 'black knight'
		all_pieces.push(black_knight)
		
		black_knight = ChessPiece.new
		black_knight.location = 'g1'
		black_knight.piece = 'black knight'
		all_pieces.push(black_knight)
		
		black_rook = ChessPiece.new
		black_rook.location = 'a1'
		black_rook.piece = 'black rook'
		all_pieces.push(black_rook)
		
		black_rook = ChessPiece.new
		black_rook.location = 'h1'
		black_rook.piece = 'black rook'
		all_pieces.push(black_rook)
		
		black_bishop = ChessPiece.new
		black_bishop.location = 'c1'
		black_bishop.piece = 'black bishop'
		all_pieces.push(black_bishop)
		
		black_bishop = ChessPiece.new
		black_bishop.location = 'f1'
		black_bishop.piece = 'black bishop'
		all_pieces.push(black_bishop)
		
		white_pawn_locations = ['a7', 'b7', 'c7', 'd7', 'e7', 'f7', 'g7', 'h7']
		(1..8).each do |i|
			pawn = ChessPiece.new
			pawn.location = white_pawn_locations[i-1]
			pawn.piece = 'white pawn'
			all_pieces.push(pawn)
		end
		
		black_pawn_locations = ['a2', 'b2', 'c2', 'd2', 'e2', 'f2', 'g2', 'h2']
		(1..8).each do |i|
			pawn = ChessPiece.new
			pawn.location = black_pawn_locations[i-1]
			pawn.piece = 'black pawn'
			all_pieces.push(pawn)
		end
		
		all_pieces
	end
end


get '/get_starting_board' do
	board = ChessBoard.new
	board.get_starting_board.to_json
end