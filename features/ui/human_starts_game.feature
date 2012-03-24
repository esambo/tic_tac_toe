Feature: Human Starts Game
  In order to play Tic Tac Toe  
  As a human player  
  I want to start the game  

  Scenario: start game
    When I start a game
    Then I should see "Tic-Tac-Toe"
    And I should see the grid next
    And I should see the player "X" go next
    And I should see the grid next
    And I should see the player "O" go next

  Scenario: mark already taken position
    Given I will mark an already taken position
    And I start a game
    Then I should see that it was invalid

  Scenario: draw game
    When I start a draw game
    Then I should see the player "X" go next
    And the game should be a draw next
