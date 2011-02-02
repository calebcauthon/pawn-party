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

Given /^the direction is up$/ do
	@direction = :up
end

When /^available moves are calculated$/ do
	@available_moves = @chessboard.get_available_moves(@piece, @algebraic_notation, @direction)
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

