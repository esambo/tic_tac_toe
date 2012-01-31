Feature: Place Mark
  In order to play Tic Tac Toe
  As a human player
  I want to place a mark

  Scenario: place a mark
    Given I am the first player "X"
    When I place the mark:
      | X |   |   |
      |   |   |   |
      |   |   |   |
    Then I should see the new positions:
      | X |   |   |
      |   |   |   |
      |   |   |   |

  Scenario: players take turn
    Given I am the first player "X"
    When I place the mark:
      | X |   |   |
      |   |   |   |
      |   |   |   |
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

  Scenario: validate place mark space
    Given the positions:
      | X |   |   |
      |   |   |   |
      |   |   |   |
    When I place the mark:
      | O |   |   |
      |   |   |   |
      |   |   |   |
    Then the last placed mark should not be valid
