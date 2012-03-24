Feature: Players take turns
  In order to play Tic Tac Toe  
  As a human player  
  I want to play against an opponent  

  Scenario: take turns
    Given the grid:
      | X | O |   |
      | X |   |   |
      | O |   |   |
    When the game continuous
    Then the grid should update
    And player "X" should go next
    And the grid should update
    And player "O" should go next

  Scenario: mark open position
    Given the grid:
      | X | O |   |
      | X |   |   |
      | O |   |   |
    And I will mark position number "3"
    When the game continuous
    Then player "O" should go next
    And the next position number provided should be "3"
    And the grid should update

  Scenario: mark already taken position
    Given the grid:
      | X | O |   |
      | X |   |   |
      | O |   |   |
    And I will mark position number "1"
    And I will mark position number "3"
    When the game continuous
    Then player "O" should go next
    And the next position number provided should be "1"
    And the position number should be invalid
    And player "O" should go next
    And the next position number provided should be "3"
    And the grid should update

  Scenario: take turns until terminal game 1247536
    Given the grid:
      | X | O |   |
      | X |   |   |
      | O |   |   |
    And I will mark position number "3"
    When the game continuous
    Then player "X" should go next
    And player "O" should go next
    And player "X" should go next
