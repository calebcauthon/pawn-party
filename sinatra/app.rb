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
	
		(1..32).each do |i|
			pawn = ChessPiece.new
			pawn.location = 'a2'
			pawn.piece = 'white pawn'
			all_pieces.push(pawn)
		end
		
		all_pieces
	end
end
