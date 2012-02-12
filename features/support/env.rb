$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'rspec/expectations'

require 'tic_tac_toe/contexts/best_position_context'
require 'tic_tac_toe/contexts/place_mark_context'
require 'tic_tac_toe/roles/minimax'
require 'tic_tac_toe/roles/open_ply_finder'
require 'tic_tac_toe/roles/mark_placer'
require 'tic_tac_toe/roles/winner'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/response_set'
require 'tic_tac_toe/data/win_position'
require 'tic_tac_toe/board_mark_converter'
