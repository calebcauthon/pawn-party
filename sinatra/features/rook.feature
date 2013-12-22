Feature: Rook Movement
	Scenario: Detecting rook moves

		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   | 1 |   | 8  |
		|   |   |   |   |   |   | 1 |   | 7  |
		|   |   |   |   |   |   | 1 |   | 6  |
		|   |   |   |   |   |   | 1 |   | 5  |
		|   |   |   |   |   |   | 1 |   | 4  |
		|   |   |   |   |   |   | 1 |   | 3  |
		|   |   |   |   |   |   | 1 |   | 2  |
		| 1 | 1 | 1 | 1 | 1 | 1 | wr| 1 | 1  |
		
		When available moves are calculated for the white rook at g1
		Then the squares marked with a 1 should be the available moves
		And the number of available moves should be 14
		
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   | 2 |   |   |   |   |   |   | 8  |
		|   | 2 |   |   |   |   |   |   | 7  |
		|   | 2 |   |   |   |   |   |   | 6  |
		| 2 | br| 2 | 2 | 2 | 2 | wp|   | 5  |
		|   | 2 |   |   |   |   | 1 |   | 4  |
		|   | bp|   |   |   |   | 1 |   | 3  |
		|   |   |   |   |   |   | 1 |   | 2  |
		|   |   |   |   | wp| 1 | wr| 1 | 1  |
		
		When available moves are calculated for the white rook at g1
		Then the squares marked with a 1 should be the available moves
		And the number of available moves should be 5
		
		When available moves are calculated for the black rook at b5
		Then the squares marked with a 2 should be the available moves
		And the number of available moves should be 10
		And one of the available moves should be g5