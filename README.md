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
- Add missing _PlaceMarkContext_
  - return _ResponseModel_:
     - _valid?_
       - have it returned by _place_mark_
     - _player_
     - _terminal?_
     - _winner?_
     - _positions_
- Add new _GetBestNumberContext_
 - call _PlaceMarkContext_ with result
- GUI
  - Command Line Interface
- Living Documentation
  - RelishApp
- DCI: Extract roles out of the Game to increase cohesion and logical grouping of code & tests
  - _MakeMove_
  - _MakeGameTree_
  - _MakeNextBestMove_
  - _Make Game Status_
