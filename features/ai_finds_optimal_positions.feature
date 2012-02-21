@slow
Feature: AI finds optimal positions
  In order to win ASAP  
  As an AI player  
  I want to place my numerical marks in the optimal positions   

  Numeric marks indicate sequence positions that the AI player 'X' should find and mark.  
  Alphabetic marks indicate sequence positions that the player 'O' will mark when it is its ply.  
  'X' marks have previously already been analyzed and can therefore be placed on the initial board in any order.  
  'O' marks can be placed on the initial board in any order.  
  '*' indicates the optimal winning position that the AI player 'X' should find based on the marks of player 'O'.  
  The scenario number indicates the alternating sequence numbers of how 'X' and 'O' place their marks in this game.  
  Based on [Wikipedia optimal decision tree for player X in Tic-Tac-Toe](http://upload.wikimedia.org/wikipedia/commons/d/de/Tictactoe-X.svg) 
  without the two draws and reduced requirements for: 
  1243, 124753, 1342, 134752, 142356, 152376, 1652, 165932, 172354, 183254, 193274  

  Scenario: 12437
    Given the grid sequence:
      | X | O | O |
      | X | _ | _ |
      | 3 | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 12457
    Given the grid sequence:
      | X | O | _ |
      | X | O | _ |
      | 3 | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 12467
    Given the grid sequence:
      | X | O | _ |
      | X | _ | O |
      | 3 | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1247536
    Given the grid sequence:
      | X | O | O |
      | X | X | 4 |
      | O | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1247569
    Given the grid sequence:
      | X | O | _ |
      | X | X | O |
      | O | _ | 4 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1247586
    Given the grid sequence:
      | X | O | _ |
      | X | X | 4 |
      | O | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1247596
    Given the grid sequence:
      | X | O | _ |
      | X | X | 4 |
      | O | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 12487
    Given the grid sequence:
      | X | O | _ |
      | X | _ | _ |
      | 3 | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 12497
    Given the grid sequence:
      | X | O | _ |
      | X | _ | _ |
      | 3 | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 13427
    Given the grid sequence:
      | X | O | O |
      | X | _ | _ |
      | 3 | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 13457
    Given the grid sequence:
      | X | _ | O |
      | X | O | _ |
      | 3 | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 13467
    Given the grid sequence:
      | X | _ | O |
      | X | _ | O |
      | 3 | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1347526
    Given the grid sequence:
      | X | O | O |
      | X | X | 4 |
      | O | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1347569
    Given the grid sequence:
      | X | _ | O |
      | X | X | O |
      | O | _ | 4 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1347586
    Given the grid sequence:
      | X | _ | O |
      | X | X | 4 |
      | O | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1347596
    Given the grid sequence:
      | X | _ | O |
      | X | X | 4 |
      | O | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 13487
    Given the grid sequence:
      | X | _ | O |
      | X | _ | _ |
      | 3 | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 13497
    Given the grid sequence:
      | X | _ | O |
      | X | _ | _ |
      | 3 | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1423568
    Given the grid sequence:
      | X | X | O |
      | O | X | O |
      | _ | 4 | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1423578
    Given the grid sequence:
      | X | X | O |
      | O | X | _ |
      | O | 4 | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1423589
    Given the grid sequence:
      | X | X | O |
      | O | X | _ |
      | _ | O | 4 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1423598
    Given the grid sequence:
      | X | X | O |
      | O | X | _ |
      | _ | 4 | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 14253
    Given the grid sequence:
      | X | X | 3 |
      | O | O | _ |
      | _ | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 14263
    Given the grid sequence:
      | X | X | 3 |
      | O | _ | O |
      | _ | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 14273
    Given the grid sequence:
      | X | X | 3 |
      | O | _ | _ |
      | O | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 14283
    Given the grid sequence:
      | X | X | 3 |
      | O | _ | _ |
      | _ | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 14293
    Given the grid sequence:
      | X | X | 3 |
      | O | _ | _ |
      | _ | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1523764
    Given the grid sequence:
      | X | X | O |
      | 4 | O | O |
      | X | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1523784
    Given the grid sequence:
      | X | X | O |
      | 4 | O | _ |
      | X | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1523794
    Given the grid sequence:
      | X | X | O |
      | 4 | O | _ |
      | X | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 15243
    Given the grid sequence:
      | X | X | 3 |
      | O | O | _ |
      | _ | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 15263
    Given the grid sequence:
      | X | X | 3 |
      | _ | O | O |
      | _ | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 15273
    Given the grid sequence:
      | X | X | 3 |
      | _ | O | _ |
      | O | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 15283
    Given the grid sequence:
      | X | X | 3 |
      | _ | O | _ |
      | _ | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 15293
    Given the grid sequence:
      | X | X | 3 |
      | _ | O | _ |
      | _ | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 16529
    Given the grid sequence:
      | X | O | _ |
      | _ | X | O |
      | _ | _ | 3 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 16539
    Given the grid sequence:
      | X | _ | O |
      | _ | X | O |
      | _ | _ | 3 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 16549
    Given the grid sequence:
      | X | _ | _ |
      | O | X | O |
      | _ | _ | 3 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 16579
    Given the grid sequence:
      | X | _ | _ |
      | _ | X | O |
      | O | _ | 3 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 16589
    Given the grid sequence:
      | X | _ | _ |
      | _ | X | O |
      | _ | O | 3 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1659327
    Given the grid sequence:
      | X | O | X |
      | _ | X | O |
      | 4 | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1659342
    Given the grid sequence:
      | X | 4 | X |
      | O | X | O |
      | _ | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1659372
    Given the grid sequence:
      | X | 4 | X |
      | _ | X | O |
      | O | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1659382
    Given the grid sequence:
      | X | 4 | X |
      | _ | X | O |
      | _ | O | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1723548
    Given the grid sequence:
      | X | X | O |
      | O | X | _ |
      | O | 4 | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1723568
    Given the grid sequence:
      | X | X | O |
      | _ | X | O |
      | O | 4 | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1723589
    Given the grid sequence:
      | X | X | O |
      | _ | X | _ |
      | O | O | 4 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1723598
    Given the grid sequence:
      | X | X | O |
      | _ | X | _ |
      | O | 4 | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 17243
    Given the grid sequence:
      | X | X | 3 |
      | O | _ | _ |
      | O | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 17253
    Given the grid sequence:
      | X | X | 3 |
      | _ | O | _ |
      | O | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 17263
    Given the grid sequence:
      | X | X | 3 |
      | _ | _ | O |
      | O | _ | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 17283
    Given the grid sequence:
      | X | X | 3 |
      | _ | _ | _ |
      | O | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 17293
    Given the grid sequence:
      | X | X | 3 |
      | _ | _ | _ |
      | O | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1832547
    Given the grid sequence:
      | X | O | X |
      | O | X | _ |
      | 4 | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1832567
    Given the grid sequence:
      | X | O | X |
      | _ | X | O |
      | 4 | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1832579
    Given the grid sequence:
      | X | O | X |
      | _ | X | _ |
      | O | O | 4 |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1832597
    Given the grid sequence:
      | X | O | X |
      | _ | X | _ |
      | 4 | O | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 18342
    Given the grid sequence:
      | X | 3 | X |
      | O | _ | _ |
      | _ | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 18352
    Given the grid sequence:
      | X | 3 | X |
      | _ | O | _ |
      | _ | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 18362
    Given the grid sequence:
      | X | 3 | X |
      | _ | _ | O |
      | _ | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 18372
    Given the grid sequence:
      | X | 3 | X |
      | _ | _ | _ |
      | O | O | _ |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 18392
    Given the grid sequence:
      | X | 3 | X |
      | _ | _ | _ |
      | _ | O | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1932745
    Given the grid sequence:
      | X | O | X |
      | O | 4 | _ |
      | X | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1932754
    Given the grid sequence:
      | X | O | X |
      | 4 | O | _ |
      | X | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1932764
    Given the grid sequence:
      | X | O | X |
      | 4 | _ | O |
      | X | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 1932784
    Given the grid sequence:
      | X | O | X |
      | 4 | _ | _ |
      | X | O | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 19342
    Given the grid sequence:
      | X | 3 | X |
      | O | _ | _ |
      | _ | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 19352
    Given the grid sequence:
      | X | 3 | X |
      | _ | O | _ |
      | _ | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 19362
    Given the grid sequence:
      | X | 3 | X |
      | _ | _ | O |
      | _ | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 19372
    Given the grid sequence:
      | X | 3 | X |
      | _ | _ | _ |
      | O | _ | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions

  Scenario: 19382
    Given the grid sequence:
      | X | 3 | X |
      | _ | _ | _ |
      | _ | O | O |
    When the AI places its best sequential positions
    Then "X" should "win"
    And the AI should have placed its marks at the indicated positions
