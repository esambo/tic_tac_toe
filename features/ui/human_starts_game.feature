Feature: Human Starts Game
  In order to play Tic Tac Toe  
  As a human player  
  I want to start the game  

  Scenario: start game
    When I start a game
    Then I should see "Tic-Tac-Toe"
    And I should see the grid next
    And I should see the position number of player "X" next
    And I should see the grid next
    And I should see that the next ply is for player "O" next
