Feature: chess board
	Scenario: Getting an empty chess board
		Given I have created a starting chess board
		Then I should see 8 pieces named "black pawn"
		And I should see 2 pieces named "black rook"
		And I should see 2 pieces named "black bishop"
		And I should see 2 pieces named "black knight"
		And I should see 1 pieces named "black king"
		And I should see 1 pieces named "black queen"
		
		And I should see 8 pieces named "white pawn"
		And I should see 2 pieces named "white rook"
		And I should see 2 pieces named "white bishop"
		And I should see 2 pieces named "white knight"
		And I should see 1 pieces named "white king"
		And I should see 1 pieces named "white queen"
		
		And I should see 32 pieces
		
		And I should see a black pawn at a2
		And I should see a black pawn at b2
		And I should see a black pawn at c2
		And I should see a black pawn at d2
		And I should see a black pawn at e2
		And I should see a black pawn at f2
		And I should see a black pawn at g2
		And I should see a black pawn at h2
		
		And I should see a white pawn at a7
		And I should see a white pawn at b7
		And I should see a white pawn at c7
		And I should see a white pawn at d7
		And I should see a white pawn at e7
		And I should see a white pawn at f7
		And I should see a white pawn at g7
		And I should see a white pawn at h7
		
		And I should see a black rook at a1
		And I should see a black knight at b1
		And I should see a black bishop at c1
		And I should see a black queen at d1
		And I should see a black king at e1
		And I should see a black bishop at f1
		And I should see a black knight at g1
		And I should see a black rook at h1
		
		And I should see a white rook at a8
		And I should see a white knight at b8
		And I should see a white bishop at c8
		And I should see a white queen at d8
		And I should see a white king at e8
		And I should see a white bishop at f8
		And I should see a white knight at g8
		And I should see a white rook at h8
		
	Scenario: Getting available moves for a pawn with a piece to capture
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   |   |   |   |   | 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   | bp|   |   |   |   |   |   | 4  |
		| wp|   |   |   |   |   |   |   | 3  |
		|   |   |   |   |   |   |   |   | 2  |
		|   |   |   |   |   |   |   |   | 1  |
		Then chessboard should detect a black piece at b4
		And chessboard should detect a white piece at a3
	
	Scenario: Getting available moves for a pawn with a piece to capture
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   |   |   |   |   | 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   | bp|   |   |   |   |   |   | 4  |
		| wp|   |   |   |   |   |   |   | 3  |
		|   |   |   |   |   |   |   |   | 2  |
		|   |   |   |   |   |   |   |   | 1  |
		When available moves are calculated for the white pawn at a3
		Then the number of available moves should be 2
		And one of the available moves should be a4
		And one of the available moves should be b4
		
	Scenario: Getting available moves for a pawn with a piece to capture
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   |   |   |   |   | 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   | bp|   |   |   |   |   |   | 4  |
		| wp|   |   |   |   |   |   |   | 3  |
		|   |   |   |   |   |   |   |   | 2  |
		|   |   |   |   |   |   |   |   | 1  |
		When available moves are calculated for the white pawn at a3
		Then the number of available moves should be 2
		And one of the available moves should be a4
		And one of the available moves should be b4
		
	Scenario: Getting available moves for a pawn with something in front of it
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   |   |   |   |   | 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   |   |   |   |   |   |   |   | 4  |
		| wp|   |   |   |   |   |   |   | 3  |
		| wp|   |   |   |   |   |   |   | 2  |
		|   |   |   |   |   |   |   |   | 1  |
		When available moves are calculated for the white pawn at a2
		Then the number of available moves should be 0
		
	Scenario: Getting available moves for a non home row pawn without anything in front of it
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   |   |   |   |   | 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   |   |   |   |   |   |   |   | 4  |
		| wp|   |   |   |   |   |   |   | 3  |
		|   |   |   |   |   |   |   |   | 2  |
		|   |   |   |   |   |   |   |   | 1  |
		When available moves are calculated for the white pawn at a3
		Then the number of available moves should be 1
		And one of the available moves should be a4		
	
	Scenario: Getting available moves for a home row pawn without anything in front of it
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   |   |   |   |   | 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   |   |   |   |   |   |   |   | 4  |
		|   |   |   |   |   |   |   |   | 3  |
		| wp|   |   |   |   |   |   |   | 2  |
		|   |   |   |   |   |   |   |   | 1  |
		When available moves are calculated for the white pawn at a2
		Then the number of available moves should be 2
		And one of the available moves should be a3
		And one of the available moves should be a4

	Scenario: Detecting a white piece
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   |   |   |   |   | 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   |   |   |   |   |   |   |   | 4  |
		|   |   |   |   |   |   |   |   | 3  |
		| wp|   |   |   |   |   |   |   | 2  |
		|   |   |   |   |   |   |   |   | 1  |		
		Then chessboard should detect a white piece at a2

	Scenario: Detecting a black piece
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   |   |   |   |   | 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   | bp|   |   |   |   |   |   | 4  |
		|   |   |   |   |   |   |   |   | 3  |
		|   |   |   |   |   |   |   |   | 2  |
		|   |   |   |   |   |   |   |   | 1  |
		Then chessboard should detect a black piece at b4	
	Scenario: Detecting a black piece
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		| br| bk| bb| bq| bK| bb| bk| br| 8  |
		| bp| bp| bp| bp| bp| bp| bp| bp| 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   |   |   |   |   |   |   |   | 4  |
		|   |   |   |   |   |   |   |   | 3  |
		| wp| wp| wp| wp| wp| wp| wp| wp| 2  |
		| wr| wk| wb| wK| wq| wb| wk| wr| 1  |
		Then chessboard should detect a black piece at a7	
		Then chessboard should detect a black piece at b7	
		Then chessboard should detect a black piece at c7	
		Then chessboard should detect a black piece at d7	
		Then chessboard should detect a black piece at e7	
		Then chessboard should detect a black piece at f7	
		Then chessboard should detect a black piece at g7	
		Then chessboard should detect a black piece at h7	
		
		Then chessboard should detect a black piece at a8	
		Then chessboard should detect a black piece at b8	
		Then chessboard should detect a black piece at c8	
		Then chessboard should detect a black piece at d8	
		Then chessboard should detect a black piece at e8	
		Then chessboard should detect a black piece at f8	
		Then chessboard should detect a black piece at g8	
		Then chessboard should detect a black piece at h8
		