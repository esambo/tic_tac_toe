$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'rspec/expectations'

require 'contexts/best_position_number_context'
require 'contexts/place_mark_context'
require 'roles/minimax'
require 'roles/open_ply_finder'
require 'roles/mark_placer'
require 'roles/winner'
require 'data/board_state'
require 'data/player'
require 'data/response_set'
require 'board_mark_converter'
