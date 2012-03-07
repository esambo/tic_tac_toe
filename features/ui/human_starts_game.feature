Feature: Human Starts Game
  In order to play Tic Tac Toe  
  As a human player  
  I want to start the game  

  Scenario: start game
    When I start the game (with some pre-fills)
    Then I should see "Tic-Tac-Toe"
    And I should see the grid
    And I should see the position number of player "X"
