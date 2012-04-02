@slow
Feature: AI playing second without losing
  In order to play Tic Tac Toe  
  As an AI player  
  I want to never lose and win whenever possible  

  Scenario: analyze the second ply with a center
    Given the grid:
      |   |   |   |
      |   | X |   |
      |   |   |   |
    When the AI analyzes the best position
    Then the game should at least be a draw
