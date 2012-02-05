# Simple Tic-Tac-Toe program

- allow for a human player
- play against a human
- have some user interface, text is fine
- never lose.  Furthermore, it should win whenever possible


## ToDo

- Rename _BoardMarkConverter_ to _GameTestController_
  - Make use of it
- Extract _GameTestPresenter_
  - Use DI from Objects on Rails
- Add new _GetBestPositionContext_
 - call _PlaceMarkContext_ with result
- GUI
  - Command Line Interface
- Living Documentation
  - RelishApp


## Design Decisions

- Living Documentation
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
