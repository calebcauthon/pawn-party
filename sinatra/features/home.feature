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
		
	Scenario: Detecting moves
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
		
		When available moves are calculated for the white pawn at a2
		Then one of the available moves should be a3
		And one of the available moves should be a4
		
		When available moves are calculated for the white pawn at f2
		Then one of the available moves should be f3
		And one of the available moves should be f4
		
		When available moves are calculated for the black pawn at a7
		Then one of the available moves should be a6
		And one of the available moves should be a5
		
		When available moves are calculated for the white knight at b1
		Then one of the available moves should be c3
		And one of the available moves should be a3
		
		When available moves are calculated for the black knight at b8
		Then one of the available moves should be c6
		And one of the available moves should be a6
	
	Scenario: Detecting moves
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		| br| bk| bb| bq| bK| bb| bk| br| 8  |
		| bp| bp| bp| bp| bp| bp| bp| bp| 7  |
		|   |   |   |   |   |   |   |   | 6  |
		|   | 1 |   | 1 |   |   |   |   | 5  |
		| 1 |   |   |   | 1 |   |   |   | 4  |
		|   |   | wk|   |   |   |   |   | 3  |
		| 1 | wp| wp| wp| 1 | wp| wp| wp| 2  |
		| wr| 1 | wb| 1 | wq| wb| wk| wr| 1  |			
		
		When available moves are calculated for the white knight at c3
		Then the squares marked with a 1 should be the available moves

	Scenario: Detecting moves
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		| br| 1 | bb| 1 | bK| bb| bk| br| 8  |
		| 1 | bp| bp| bp| 1 | bp| bp| bp| 7  |
		|   |   | bk|   |   |   |   |   | 6  |
		| 1 |   |   |   | 1 |   |   |   | 5  |
		|   | 1 |   | 1 |   |   |   |   | 4  |
		|   |   |   |   |   |   |   |   | 3  |
		| wp| wp| wp| wp| wp| wp| wp| wp| 2  |
		| wr| wk| wb| wK| wq| wb| wk| wr| 1  |			
		
		When available moves are calculated for the black knight at c6
		Then the squares marked with a 1 should be the available moves	
	
	Scenario: Detecting moves
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		| br| 1 | bb| 1 | bK| bb| bk| br| 8  |
		| 1 | bp| bp| bp| 1 | bp| bp| bp| 7  |
		|   |   | bk|   |   |   |   |   | 6  |
		| 1 |   |   |   | 1 |   |   |   | 5  |
		|   | 1 |   | wp|   |   |   |   | 4  |
		|   |   |   |   |   |   |   |   | 3  |
		| wp| wp| wp| wp| wp| wp| wp| wp| 2  |
		| wr| wk| wb| wK| wq| wb| wk| wr| 1  |			
		
		When available moves are calculated for the black knight at c6
		Then the squares marked with a 1 should be the available moves
		And one of the available moves should be d4

	Scenario: Detecting moves
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		| br| 1 | bb| 1 | bK| bb| bk| br| 8  |
		| 1 | bp| bp| bp| 1 | bp| bp| bp| 7  |
		|   |   | bk|   |   |   |   |   | 6  |
		| 1 |   |   |   | 1 |   |   |   | 5  |
		|   | 1 |   | bp|   |   |   |   | 4  |
		|   |   |   |   |   |   |   |   | 3  |
		| wp| wp| wp| wp| wp| wp| wp| wp| 2  |
		| wr| wk| wb| wK| wq| wb| wk| wr| 1  |			
		
		When available moves are calculated for the black knight at c6
		Then the squares marked with a 1 should be the available moves
		And none of the available moves should be d4
		
	Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		| br| bk| bb| bq| bK| bb| bk| br| 8  |
		| bp| bp| bp| 1 | bp| bp| bp| bp| 7  |
		|   |   |   | 1 |   |   |   |   | 6  |
		|   |   |   | 1 |   |   |   |   | 5  |
		|   |   |   | 1 |   |   |   |   | 4  |
		|   |   |   | 1 |   |   |   |   | 3  |
		| wp| wp| wp| wp| wp| wp| wp| wp| 2  |
		| wr| wk| wb| wK| wq| wb| wk| wr| 1  |
		
		When available moves are calculated for the black queen at d8
		Then the squares marked with a 1 should be the available moves
		And one of the available moves should be d2
		And the number of available moves should be 6
	
	Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		| br| bk| bb| bq| bK| bb| bk| br| 8  |
		| bp| bp| bp| bp| 1 | bp| bp| bp| 7  |
		|   |   |   |   |   | 1 |   |   | 6  |
		|   |   |   |   |   |   | 1 |   | 5  |
		|   |   |   |   |   |   |   | 1 | 4  |
		|   |   |   |   |   |   |   |   | 3  |
		| wp| wp| wp| wp| wp| wp| wp| wp| 2  |
		| wr| wk| wb| wK| wq| wb| wk| wr| 1  |
		
		When available moves are calculated for the black queen at d8
		Then the squares marked with a 1 should be the available moves		
		And the number of available moves should be 4
		
		