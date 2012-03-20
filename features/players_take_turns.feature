Feature: Players take turns
  In order to play Tic Tac Toe  
  As a human player  
  I want to play against an opponent  

  Scenario: take turns
    Given the grid:
      | X | O |   |
      | X |   |   |
      | O | _ | _ |
    When the game continuous
    Then player "X" should go next
    And player "O" should go next

  Scenario: mark open position
    Given the grid:
      | X | O |   |
      | X |   |   |
      | O | _ | _ |
    And I will mark position number "3"
    When the game continuous
    Then player "X" should go next
    And player "O" should go next
