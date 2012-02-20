@slow
Feature: AI places marks in optimal positions
  In order to win ASAP  
  As an AI player  
  I want to place my marks 'X' in the optimal positions   

  Numeric marks indicate sequence positions that the AI player 'X' should find and mark.  
  Alphabetic marks indicate sequence positions that the player 'O' will mark when it is its ply.  
  'X' marks have previously already been analyzed and can therefore be placed on the initial board in any order.  
  'O' marks can be placed on the initial board in any order.  
  '*' indicates the optimal winning position that the AI player 'X' should find based on the marks of player 'O'.  
  The scenario number indicates the alternating sequence numbers of how 'X' and 'O' place their marks in this game.  

  Scenario: 12437
    Given the grid sequence with the indicated winning mark "*":
      | 1 | A | B |
      | 2 | _ | _ |
      | * | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 12457
    Given the grid sequence with the indicated winning mark "*":
      | X | O | _ |
      | X | O | _ |
      | * | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 12467
    Given the grid sequence with the indicated winning mark "*":
      | X | O | _ |
      | X | _ | O |
      | * | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1247536
    Given the grid sequence with the indicated winning mark "*":
      | X | O | C |
      | X | 3 | * |
      | O | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1247569
    Given the grid sequence with the indicated winning mark "*":
      | X | O | _ |
      | X | X | O |
      | O | _ | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1247586
    Given the grid sequence with the indicated winning mark "*":
      | X | O | _ |
      | X | X | * |
      | O | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1247596
    Given the grid sequence with the indicated winning mark "*":
      | X | O | _ |
      | X | X | * |
      | O | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 12487
    Given the grid sequence with the indicated winning mark "*":
      | X | O | _ |
      | X | _ | _ |
      | * | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 12497
    Given the grid sequence with the indicated winning mark "*":
      | X | O | _ |
      | X | _ | _ |
      | * | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 13427
    Given the grid sequence with the indicated winning mark "*":
      | X | B | O |
      | 2 | _ | _ |
      | * | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 13457
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | O |
      | X | O | _ |
      | * | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 13467
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | O |
      | X | _ | O |
      | * | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1347526
    Given the grid sequence with the indicated winning mark "*":
      | X | C | O |
      | X | 3 | * |
      | O | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1347569
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | O |
      | X | X | O |
      | O | _ | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1347586
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | O |
      | X | X | * |
      | O | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1347596
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | O |
      | X | X | * |
      | O | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 13487
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | O |
      | X | _ | _ |
      | * | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 13497
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | O |
      | X | _ | _ |
      | * | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1423568
    Given the grid sequence with the indicated winning mark "*":
      | X | 2 | B |
      | O | 3 | C |
      | _ | * | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1423578
    Given the grid sequence with the indicated winning mark "*":
      | X | X | O |
      | O | X | _ |
      | O | * | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1423589
    Given the grid sequence with the indicated winning mark "*":
      | X | X | O |
      | O | X | _ |
      | _ | O | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1423598
    Given the grid sequence with the indicated winning mark "*":
      | X | X | O |
      | O | X | _ |
      | _ | * | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 14253
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | O | O | _ |
      | _ | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 14263
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | O | _ | O |
      | _ | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 14273
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | O | _ | _ |
      | O | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 14283
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | O | _ | _ |
      | _ | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 14293
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | O | _ | _ |
      | _ | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1523764
    Given the grid sequence with the indicated winning mark "*":
      | X | 2 | B |
      | * | O | C |
      | 3 | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1523784
    Given the grid sequence with the indicated winning mark "*":
      | X | X | O |
      | * | O | _ |
      | X | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1523794
    Given the grid sequence with the indicated winning mark "*":
      | X | X | O |
      | * | O | _ |
      | X | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 15243
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | O | O | _ |
      | _ | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 15263
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | _ | O | O |
      | _ | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 15273
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | _ | O | _ |
      | O | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 15283
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | _ | O | _ |
      | _ | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 15293
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | _ | O | _ |
      | _ | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 16529
    Given the grid sequence with the indicated winning mark "*":
      | X | B | _ |
      | _ | 2 | O |
      | _ | _ | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 16539
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | O |
      | _ | X | O |
      | _ | _ | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 16549
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | _ |
      | O | X | O |
      | _ | _ | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 16579
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | _ |
      | _ | X | O |
      | O | _ | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 16589
    Given the grid sequence with the indicated winning mark "*":
      | X | _ | _ |
      | _ | X | O |
      | _ | O | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1659327
    Given the grid sequence with the indicated winning mark "*":
      | X | C | 3 |
      | _ | X | O |
      | * | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1659342
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | O | X | O |
      | _ | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1659372
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | X | O |
      | O | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1659382
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | X | O |
      | _ | O | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1723548
    Given the grid sequence with the indicated winning mark "*":
      | X | 2 | B |
      | C | 3 | _ |
      | O | * | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1723568
    Given the grid sequence with the indicated winning mark "*":
      | X | X | O |
      | _ | X | O |
      | O | * | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1723589
    Given the grid sequence with the indicated winning mark "*":
      | X | X | O |
      | _ | X | _ |
      | O | O | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1723598
    Given the grid sequence with the indicated winning mark "*":
      | X | X | O |
      | _ | X | _ |
      | O | * | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 17243
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | O | _ | _ |
      | O | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 17253
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | _ | O | _ |
      | O | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 17263
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | _ | _ | O |
      | O | _ | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 17283
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | _ | _ | _ |
      | O | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 17293
    Given the grid sequence with the indicated winning mark "*":
      | X | X | * |
      | _ | _ | _ |
      | O | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1832547
    Given the grid sequence with the indicated winning mark "*":
      | X | B | 2 |
      | C | 3 | _ |
      | * | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1832567
    Given the grid sequence with the indicated winning mark "*":
      | X | O | X |
      | _ | X | O |
      | * | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1832579
    Given the grid sequence with the indicated winning mark "*":
      | X | O | X |
      | _ | X | _ |
      | O | O | * |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1832597
    Given the grid sequence with the indicated winning mark "*":
      | X | O | X |
      | _ | X | _ |
      | * | O | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 18342
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | O | _ | _ |
      | _ | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 18352
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | O | _ |
      | _ | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 18362
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | _ | O |
      | _ | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 18372
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | _ | _ |
      | O | O | _ |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 18392
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | _ | _ |
      | _ | O | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1932745
    Given the grid sequence with the indicated winning mark "*":
      | X | B | 2 |
      | C | * | _ |
      | 3 | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1932754
    Given the grid sequence with the indicated winning mark "*":
      | X | O | X |
      | * | O | _ |
      | X | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1932764
    Given the grid sequence with the indicated winning mark "*":
      | X | O | X |
      | * | _ | O |
      | X | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 1932784
    Given the grid sequence with the indicated winning mark "*":
      | X | O | X |
      | * | _ | _ |
      | X | O | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 19342
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | O | _ | _ |
      | _ | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 19352
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | O | _ |
      | _ | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 19362
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | _ | O |
      | _ | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 19372
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | _ | _ |
      | O | _ | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position

  Scenario: 19382
    Given the grid sequence with the indicated winning mark "*":
      | X | * | X |
      | _ | _ | _ |
      | _ | O | O |
    When the AI places its best position
    Then "X" should "win"
    And it should be at the indicated position
