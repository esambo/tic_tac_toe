Feature: Place Mark
  In order to play Tic Tac Toe
  As a human player
  I want to place a mark

  Scenario: place a mark
    Given it is my turn
    When I place a mark
    Then I should see my new positions

  Scenario: players take turn
    Given a new game
    When "X" marks a space
    Then "O" should be the current player

  Scenario: draw
    Given one empty space
    When "X" marks a space
    Then the game should be a draw
