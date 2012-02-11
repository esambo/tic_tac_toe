Feature: Best Position
  In order to play Tic Tac Toe
  As a AI player
  I want to never lose and win whenever possible

  Scenario: place the final and winning mark
    Given the grid:
      | X | O | X |
      | O | X | O |
      | O | X |   |
    When the AI places its best position
    Then I should see the grid:
      | X | O | X |
      | O | X | O |
      | O | X | X |
