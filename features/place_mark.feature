Feature: Place Mark
  In order to play Tic Tac Toe
  As a human player
  I want to place a mark

  Scenario: place a mark
    Given it is my turn
    When I place a mark
    Then I should see my new possitions
