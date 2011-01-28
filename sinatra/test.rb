require 'test/unit'
require 'json'
require 'app.rb'

class PawnPartyTests < Test::Unit::TestCase
	def test_32_pieces_are_created
		board = ChessBoard.new
		pieces = board.get_starting_board
		
		json_board = pieces.to_json
		parsed_json_board = JSON.parse(json_board)
		
		assert_equal(parsed_json_board.count, 32)
		
		parsed_json_board.each do |chess_piece|
			assert(chess_piece['location'].length > 0)
			assert(chess_piece['piece'].length > 0)
		end
	end
end

