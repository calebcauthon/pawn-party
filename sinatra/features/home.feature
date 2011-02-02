Feature: chess board

	Scenario: Getting available moves for a pawn
		Given the chess board is empty
		And the pawn is placed on a2
		And the direction is up
		When available moves are calculated
		Then the number of available moves should be 2
		And one of the available moves should be a3
		And one of the available moves should be a4
		
	Scenario: Getting an empty chess board
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
		
		Then I should see a black rook at a1
		Then I should see a black knight at b1
		Then I should see a black bishop at c1
		Then I should see a black queen at d1
		Then I should see a black king at e1
		Then I should see a black bishop at f1
		Then I should see a black knight at g1
		Then I should see a black rook at h1
		
		Then I should see a white rook at a8
		Then I should see a white knight at b8
		Then I should see a white bishop at c8
		Then I should see a white queen at d8
		Then I should see a white king at e8
		Then I should see a white bishop at f8
		Then I should see a white knight at g8
		Then I should see a white rook at h8
		
