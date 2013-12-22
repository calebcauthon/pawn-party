Feature: Bishop Movement
	Scenario: Detecting bishop moves

		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		| 1 |   |   |   |   |   |   |   | 7  |
		|   | 1 |   |   |   |   |   |   | 6  |
		|   |   | 1 |   |   |   |   |   | 5  |
		|   |   |   | 1 |   |   |   |   | 4  |
		|   |   |   |   | 1 |   |   |   | 3  |
		|   |   |   |   |   | 1 |   | 1 | 2  |
		|   |   |   |   |   |   | wb|   | 1  |
		
		When available moves are calculated for the white bishop at g1
		Then the squares marked with a 1 should be the available moves
		And the number of available moves should be 7
		
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   | 1 |   |   | 8  |
		|   |   |   |   | 1 |   |   |   | 7  |
		|   |   |   | 1 |   |   |   |   | 6  |
		| 1 |   | 1 |   |   |   |   |   | 5  |
		|   | wb|   |   |   |   |   |   | 4  |
		| 1 |   | 1 |   |   |   |   |   | 3  |
		|   |   |   | 1 |   |   |   |   | 2  |
		|   |   |   |   | 1 |   |   |   | 1  |
		
		When available moves are calculated for the white bishop at b4
		Then the squares marked with a 1 should be the available moves
		And the number of available moves should be 9
		
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   |   |   |   | 8  |
		|   |   |   |   | wp|   |   |   | 7  |
		|   |   |   | 1 |   |   |   |   | 6  |
		| 1 |   | 1 |   |   |   |   |   | 5  |
		|   | bb|   |   |   |   |   |   | 4  |
		| 1 |   | 1 |   |   |   |   |   | 3  |
		|   |   |   | 1 |   |   |   |   | 2  |
		|   |   |   |   | 1 |   |   |   | 1  |
		
		When available moves are calculated for the black bishop at b4
		Then the squares marked with a 1 should be the available moves
		And the number of available moves should be 8
		And one of the available moves should be e7
		
		Given the following chessboard setup:
		| a | b | c | d | e | f | g | h |rank|
		|   |   |   |   |   | 2 |   | 2 | 8  |
		|   |   |   |   | wp|   | wb|   | 7  |
		|   |   |   | 1 |   | bp|   | 2 | 6  |
		| 1 |   | 1 |   |   |   |   |   | 5  |
		|   | bb|   |   |   |   |   |   | 4  |
		| 1 |   | 1 |   |   |   |   |   | 3  |
		|   |   |   | 1 |   |   |   |   | 2  |
		|   |   |   |   | 1 |   |   |   | 1  |
		
		When available moves are calculated for the black bishop at b4
		Then the squares marked with a 1 should be the available moves
		And the number of available moves should be 8
		And one of the available moves should be e7
		
		When available moves are calculated for the white bishop at g7
		Then the squares marked with a 2 should be the available moves
		And the number of available moves should be 4
		And one of the available moves should be f6