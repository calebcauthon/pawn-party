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
		hash.each do |file_or_attribute_name, piece_or_rank|	
			if(file_or_attribute_name == "rank")
				rank = piece_or_rank
				
				pieces_in_this_row.each do |this_row_piece|
					this_row_piece[:rank] = rank
					all_pieces.push(this_row_piece)
				end
				
				pieces_in_this_row = Array.new
			else			
				file = file_or_attribute_name
				piece = piece_or_rank
				
				this_piece = Hash.new
				this_piece[:file] = file
				this_piece[:piece] = piece
				
				if(piece != "")
					pieces_in_this_row.push(this_piece)
				end
			end			
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
		elsif(piece_abbreviation == 'bp')
			piece = "black pawn"
		end		
		
		algebraic_notation = "#{file}#{rank}"
		@chessboard.set_piece(piece, algebraic_notation)
		#print "theres a piece in this row, piece=#{this_piece[:piece]}, rank=#{this_piece[:rank]}, file=#{this_piece[:file]}\n"
	end
end
