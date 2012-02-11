Feature: AI never loses
  In order to play Tic Tac Toe
  As a AI player
  I want to never lose and win whenever possible

  @slow
  Scenario: analyze the first ply
    Given an empty board
    When the AI analyzes the best position
    Then the game should at least be a draw
