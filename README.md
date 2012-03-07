# Simple Tic-Tac-Toe program

- allow for a human player
- play against a human
- have some user interface, text is fine
- never lose.  Furthermore, it should win whenever possible


## ToDo

- Performance tuning
  - Cache combinations to prevent calculations of all permutations
  - Remove reotations & reflections
  - Alpha Beta cutoff based on depth rank of fround winners 
     - perhaps only for first couple of plies
  - NegaMax to DRY up code?
  - DCI
     - Include instead of extend for critical parts
     - SimpleDelegator, none standard, to get self.*
     - Remove Kernel#dup/clone
  - Keep track of potential marks by individual positions instead of board_state to reduce memory consumption and garbage collection activity
  - Cacke first few depth of the game tree
- Side effect free functions


## Design Decisions

- Living Documentation
  - [Tic-Tac-Toe](http://www.relishapp.com/esambo/tic-tac-toe)
- Architecture based on
  - DCI
  - MVC
  - CleanCoders.com on [Architecture](http://www.cleancoders.com/codecast/clean-code-episode-7/show)
  - SRP
  - DRY
  - BDD
  - TDD
  - names of the domain language
- Delivery Mechanism
  - independent of the domain logic
  - CLI
- Infrastructure
  - Ruby 1.9.3
  - git
  - Cucumber
  - RSpec
