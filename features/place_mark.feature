Feature: Place Mark
  In order to play Tic Tac Toe
  As a human player
  I want to place a mark

  Scenario: place a mark
    Given I am the first player "X"
    When I place a mark
    Then I should see my new positions

  Scenario: players take turn
    Given I am the first player "X"
    When I place a mark
    Then "O" should be the current player

  Scenario: draw
    Given a game
    When the board is full without a three in a row
    Then the game should be a draw

  Scenario: win
    Given I am the first player "X"
    When I win
    Then "X" should "win"
    And "O" should "lose"
