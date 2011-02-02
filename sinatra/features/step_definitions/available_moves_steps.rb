Given /^the chess board is empty$/ do 
	@chessboard = ChessBoard.new
end

Given /^the pawn is placed on ([a-h]{1})(\d+)$/ do |file, rank|
	@algebraic_notation = "#{file}#{rank}"
	@piece = :pawn
end

Given /^the direction is up$/ do
	@direction = :up
end

When /^available moves are calculated$/ do
	@available_moves = @chessboard.get_available_moves(@piece, @algebraic_notation, @direction)
end

Then /^the number of available moves should be (\d+)$/ do |number_of_available_moves|
	@available_moves.length.should == 2
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