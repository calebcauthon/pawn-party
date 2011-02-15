Given /^the chess board is empty$/ do 
	@chessboard = ChessBoard.new
end

Given /^there is a (\S+ \S+) on ([a-h]{1})(\d+)$/ do |piece, file, rank|
	algebraic_notation = "#{file}#{rank}"
	@chessboard.set_piece(piece, algebraic_notation)
end

Given /^the white pawn is placed on ([a-h]{1})(\d+)$/ do |file, rank|
	@algebraic_notation = "#{file}#{rank}"
	@piece = 'white pawn'
end

When /^available moves are calculated for the (\S+ \S+) at ([a-h]{1})(\d+)$/ do |piece, file, rank|
	algebraic_notation = "#{file}#{rank}"
	
	@chessboard.set_piece(piece, algebraic_notation)
	@available_moves = @chessboard.get_available_moves(piece, algebraic_notation)	
end

When /^available moves are calculated$/ do
	@available_moves = @chessboard.get_available_moves(@piece, @algebraic_notation)
end

Then /^chessboard should detect a white piece at ([a-h]{1})(\d+)$/ do |file, rank|
	algebraic_notation = "#{file}#{rank}"
	@chessboard.has_white_piece(algebraic_notation).should == true
end

Then /^chessboard should detect a black piece at ([a-h]{1})(\d+)$/ do |file, rank|
	algebraic_notation = "#{file}#{rank}"
	@chessboard.has_black_piece(algebraic_notation).should == true
end

Then /^the number of available moves should be (\d+)$/ do |number_of_available_moves|
	@available_moves.length.should == number_of_available_moves.to_i
end

Then /^one of the available moves should be ([a-h]{1})(\d+)$/ do |file, rank|
	expected_algebraic_notation = "#{file}#{rank}"
	found = 0
	@available_moves.each do |this_algebraic_notation|
		if(this_algebraic_notation == expected_algebraic_notation)
			found += 1
		end
	end
	
	found.should == 1
end

Given /^the following chessboard setup:$/ do |table|
	@chessboard = ChessBoard.new
	
	all_pieces = Array.new
	pieces_in_this_row = Array.new
	
	#algebraic_notation = "#{file}#{rank}"
	#@chessboard.set_piece(piece, algebraic_notation)
	
	table.hashes.each do |hash|
		print "\n#{hash["a"]}, #{hash["rank"]}"
		
		unless(hash["a"] == "")
			file = "a"
			rank = hash["rank"]
			piece = hash["a"]
			this_piece = Hash.new
			this_piece[:file] = file
			this_piece[:rank] = rank
			this_piece[:piece] = piece
			all_pieces.push(this_piece)
		end
		unless(hash["b"] == "")
			file = "b"
			rank = hash["rank"]
			piece = hash["b"]
			this_piece = Hash.new
			this_piece[:file] = file
			this_piece[:rank] = rank
			this_piece[:piece] = piece
			all_pieces.push(this_piece)
		end
		unless(hash["c"] == "")
			file = "c"
			rank = hash["rank"]
			piece = hash["c"]
			this_piece = Hash.new
			this_piece[:file] = file
			this_piece[:rank] = rank
			this_piece[:piece] = piece
			all_pieces.push(this_piece)
		end
		unless(hash["d"] == "")
			file = "d"
			rank = hash["rank"]
			piece = hash["d"]
			this_piece = Hash.new
			this_piece[:file] = file
			this_piece[:rank] = rank
			this_piece[:piece] = piece
			all_pieces.push(this_piece)
		end
		unless(hash["e"] == "")
			file = "e"
			rank = hash["rank"]
			piece = hash["e"]
			this_piece = Hash.new
			this_piece[:file] = file
			this_piece[:rank] = rank
			this_piece[:piece] = piece
			all_pieces.push(this_piece)
		end
		unless(hash["f"] == "")
			file = "f"
			rank = hash["rank"]
			piece = hash["f"]
			this_piece = Hash.new
			this_piece[:file] = file
			this_piece[:rank] = rank
			this_piece[:piece] = piece
			all_pieces.push(this_piece)
		end
		unless(hash["g"] == "")
			file = "g"
			rank = hash["rank"]
			piece = hash["g"]
			this_piece = Hash.new
			this_piece[:file] = file
			this_piece[:rank] = rank
			this_piece[:piece] = piece
			all_pieces.push(this_piece)
		end
		unless(hash["h"] == "")
			file = "h"
			rank = hash["rank"]
			piece = hash["h"]
			this_piece = Hash.new
			this_piece[:file] = file
			this_piece[:rank] = rank
			this_piece[:piece] = piece
			all_pieces.push(this_piece)
		end
	end
	
	@algebraic_notation = "a1"
	@piece = 'white pawn'
	
	all_pieces.each do |this_piece|
		file = this_piece[:file]
		rank = this_piece[:rank]			
		piece_abbreviation = this_piece[:piece]
		
		if(piece_abbreviation == 'wp')
			piece = "white pawn"
		elsif(piece_abbreviation == 'wr')
			piece = "white rook"
		elsif(piece_abbreviation == 'wk')
			piece = "white knight"
		elsif(piece_abbreviation == 'wb')
			piece = "white bishop"
		elsif(piece_abbreviation == 'wK')
			piece = "white king"
		elsif(piece_abbreviation == 'wq')
			piece = "white queen"
		elsif(piece_abbreviation == 'bp')
			piece = "black pawn"
		elsif(piece_abbreviation == 'br')
			piece = "black rook"
		elsif(piece_abbreviation == 'bk')
			piece = "black knight"
		elsif(piece_abbreviation == 'bb')
			piece = "black bishop"
		elsif(piece_abbreviation == 'bK')
			piece = "black king"
		elsif(piece_abbreviation == 'bq')
			piece = "black queen"
		end		
		
		algebraic_notation = "#{file}#{rank}"
		@chessboard.set_piece(piece, algebraic_notation)
		#print "\ntheres a piece in this row, piece=#{this_piece[:piece]}, rank=#{this_piece[:rank]}, file=#{this_piece[:file]}\n"
	end
end
