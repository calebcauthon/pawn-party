Feature: chess board

	Scenario: API
		Given I have created a starting chess board
		Then I should see 8 pieces named "black pawn"
		Then I should see 2 pieces named "black rook"
		Then I should see 2 pieces named "black bishop"
		Then I should see 2 pieces named "black knight"
		Then I should see 1 pieces named "black king"
		Then I should see 1 pieces named "black queen"
		
		Then I should see 8 pieces named "white pawn"
		Then I should see 2 pieces named "white rook"
		Then I should see 2 pieces named "white bishop"
		Then I should see 2 pieces named "white knight"
		Then I should see 1 pieces named "white king"
		Then I should see 1 pieces named "white queen"
		
		Then I should see 32 pieces
		
