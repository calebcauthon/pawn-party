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