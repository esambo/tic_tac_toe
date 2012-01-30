# Simple Tic-Tac-Toe program

- allow for a human player
- play against a human
- have some user interface, text is fine
- never lose.  Furthermore, it should win whenever possible


## ToDo

- Valid move check
- Rename _GridMarkConverter_ to _GameTestController_
  - Make use of it
- Extract _GameTestPresenter_
- Add missing _PlaceMarkInteractor_
  - coordinate business tasks, like a controller
  - check for:
     - _valid?_
     - _winner?_
     - _full?_
- Add new _PlacePerfectMarkInteractor_
- GUI
  - Command Line Interface
- Living Documentation
  - RelishApp
- DCI: Extract toles out of the Game to increase cohesion and logical grouping of code & tests
  - _MakeMove_
  - _MakeGameTree_
  - _MakeNextBestMove_
  - _Make Game Status_
