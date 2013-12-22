Given /^I have created a starting chess board$/ do
	board = ChessBoard.new
	pieces = board.get_starting_board
	json_board = pieces.to_json
	@parsed_json_board = JSON.parse(json_board)
end

Then /^I should see (\d+) pieces named "([^\"]*)"$/ do |expected_count, name_of_piece|
  actual_count = 0
	@parsed_json_board.each do |chess_piece|
		if(chess_piece['piece'] == name_of_piece)
			actual_count += 1
		end
	end
	
	actual_count.should == expected_count.to_i
end

Then /^I should see (\d+) pieces$/ do |expected_piece_count|
  @parsed_json_board.count.should == expected_piece_count.to_i
end


Then /^I should see a ([a-z]+ [a-z]+) at ([a-h]\d+)$/ do |piece, location|
	count = 0
	@parsed_json_board.each do |chess_piece|
		if(chess_piece['piece'] == piece)
			if(chess_piece['location'] == location)
				count += 1
			end
		end
	end
	
	count.should == 1
end

