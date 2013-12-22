Feature: King Movement
	Scenario: Detecting king moves

		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		| 2 | bK| 2 |   |   |   | wp| 4 | 8  |
		| 2 | 2 | 2 |   |   |   | wp| wK| 7  |
		|   |   |   |   |   |   | bp| 4 | 6  |
		|   |   |   |   |   |   |   |   | 5  |
		|   |   |   |   |   |   |   |   | 4  |
		| 3 | 3 |   |   |   | 1 | 1 | 1 | 3  |
		| bK| 3 |   |   |   | 1 | wK| 1 | 2  |
		| 3 | 3 |   |   |   | 1 | 1 | 1 | 1  |
		
		When available moves are calculated for the white king at g2
		Then the squares marked with a 1 should be the available moves
		And the number of available moves should be 8
		
		When available moves are calculated for the black king at b8
		Then the squares marked with a 2 should be the available moves
		And the number of available moves should be 5
		
		When available moves are calculated for the black king at a2
		Then the squares marked with a 3 should be the available moves
		And the number of available moves should be 5
		
		When available moves are calculated for the white king at h7
		Then the squares marked with a 4 should be the available moves
		And the number of available moves should be 3
		And one of the available moves should be g6