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
		
		Then I should see a black pawn at a2
		Then I should see a black pawn at b2
		Then I should see a black pawn at c2
		Then I should see a black pawn at d2
		Then I should see a black pawn at e2
		Then I should see a black pawn at f2
		Then I should see a black pawn at g2
		Then I should see a black pawn at h2
		
		Then I should see a white pawn at a7
		Then I should see a white pawn at b7
		Then I should see a white pawn at c7
		Then I should see a white pawn at d7
		Then I should see a white pawn at e7
		Then I should see a white pawn at f7
		Then I should see a white pawn at g7
		Then I should see a white pawn at h7
		
