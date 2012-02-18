@slow
Feature: AI wins
  In order to play Tic Tac Toe
  As a AI player
  I want to never lose and win whenever possible

  Scenario: 1
    Given the grid sequence with the indicated winning mark X:
      | 1 | A | B |
      | 2 | _ | _ |
      | X | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 2
    Given the grid sequence with the indicated winning mark X:
      | 1 | A | _ |
      | 2 | B | _ |
      | X | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 3
    Given the grid sequence with the indicated winning mark X:
      | 1 | A | _ |
      | 2 | _ | B |
      | X | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 4
    Given the grid sequence with the indicated winning mark X:
      | 1 | A | C |
      | 2 | 3 | X |
      | B | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 5
    Given the grid sequence with the indicated winning mark X:
      | 1 | A | _ |
      | 2 | 3 | C |
      | B | _ | X |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 6
    Given the grid sequence with the indicated winning mark X:
      | 1 | A | _ |
      | 2 | 3 | X |
      | B | C | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 7
    Given the grid sequence with the indicated winning mark X:
      | 1 | A | _ |
      | 2 | 3 | X |
      | B | _ | C |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 10
    Given the grid sequence with the indicated winning mark X:
      | 1 | B | A |
      | 2 | _ | _ |
      | X | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 11
    Given the grid sequence with the indicated winning mark X:
      | 1 | _ | A |
      | 2 | B | _ |
      | X | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 12
    Given the grid sequence with the indicated winning mark X:
      | 1 | _ | A |
      | 2 | _ | B |
      | X | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 13
    Given the grid sequence with the indicated winning mark X:
      | 1 | C | A |
      | 2 | 3 | X |
      | B | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 14
    Given the grid sequence with the indicated winning mark X:
      | 1 | _ | A |
      | 2 | 3 | C |
      | B | _ | X |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 15
    Given the grid sequence with the indicated winning mark X:
      | 1 | _ | A |
      | 2 | 3 | X |
      | B | C | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 16
    Given the grid sequence with the indicated winning mark X:
      | 1 | _ | A |
      | 2 | 3 | X |
      | B | _ | C |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 19
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | A | 3 | C |
      | _ | X | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 21
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | A | 3 | _ |
      | _ | C | X |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 22
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | A | 3 | _ |
      | _ | X | C |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 23
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | A | B | _ |
      | _ | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 24
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | A | _ | B |
      | _ | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 25
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | A | _ | _ |
      | B | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 26
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | A | _ | _ |
      | _ | B | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 27
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | A | _ | _ |
      | _ | _ | B |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 28
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | X | A | C |
      | 3 | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 29
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | X | A | _ |
      | 3 | C | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 30
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | X | A | _ |
      | 3 | _ | C |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 31
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | B | A | _ |
      | _ | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 32
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | _ | A | B |
      | _ | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 33
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | _ | A | _ |
      | B | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 34
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | _ | A | _ |
      | _ | B | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 35
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | _ | A | _ |
      | _ | _ | B |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 37
    Given the grid sequence with the indicated winning mark X:
      | 1 | _ | B |
      | _ | 2 | A |
      | _ | _ | X |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 40
    Given the grid sequence with the indicated winning mark X:
      | 1 | _ | _ |
      | _ | 2 | A |
      | _ | B | X |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 41
    Given the grid sequence with the indicated winning mark X:
      | 1 | C | 3 |
      | _ | 2 | A |
      | X | _ | B |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 42
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 3 |
      | C | 2 | A |
      | _ | _ | B |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 43
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 3 |
      | _ | 2 | A |
      | C | _ | B |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 44
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 3 |
      | _ | 2 | A |
      | _ | C | B |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 46
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | _ | 3 | C |
      | A | X | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 47
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | _ | 3 | _ |
      | A | C | X |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 48
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | B |
      | _ | 3 | _ |
      | A | X | C |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 49
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | B | _ | _ |
      | A | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 50
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | _ | B | _ |
      | A | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 51
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | _ | _ | B |
      | A | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 52
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | _ | _ | _ |
      | A | B | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 53
    Given the grid sequence with the indicated winning mark X:
      | 1 | 2 | X |
      | _ | _ | _ |
      | A | _ | B |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 56
    Given the grid sequence with the indicated winning mark X:
      | 1 | B | 2 |
      | _ | 3 | _ |
      | C | A | X |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 57
    Given the grid sequence with the indicated winning mark X:
      | 1 | B | 2 |
      | _ | 3 | _ |
      | X | A | C |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 58
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | B | _ | _ |
      | _ | A | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 59
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | _ | B | _ |
      | _ | A | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 60
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | _ | _ | B |
      | _ | A | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 61
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | _ | _ | _ |
      | B | A | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 62
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | _ | _ | _ |
      | _ | A | B |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 63
    Given the grid sequence with the indicated winning mark X:
      | 1 | B | 2 |
      | C | X | _ |
      | 3 | _ | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 64
    Given the grid sequence with the indicated winning mark X:
      | 1 | B | 2 |
      | X | C | _ |
      | 3 | _ | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 65
    Given the grid sequence with the indicated winning mark X:
      | 1 | B | 2 |
      | X | _ | C |
      | 3 | _ | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 66
    Given the grid sequence with the indicated winning mark X:
      | 1 | B | 2 |
      | X | _ | _ |
      | 3 | C | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 67
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | B | _ | _ |
      | _ | _ | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 68
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | _ | B | _ |
      | _ | _ | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 69
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | _ | _ | B |
      | _ | _ | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 70
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | _ | _ | _ |
      | B | _ | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 71
    Given the grid sequence with the indicated winning mark X:
      | 1 | X | 2 |
      | _ | _ | _ |
      | _ | B | A |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position
