$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'rspec/expectations'

require 'contexts/place_mark_context'
require 'roles/mark_placer'
require 'roles/winner'
require 'data/board_state'
require 'data/player'
require 'board_mark_converter'
