require 'roles/mark_placer'
require 'roles/winner'

class PlaceMarkContext
  attr_reader :board_state, :number

  def initialize(board_state, number)
    @number      = number
    @board_state = board_state
    @board_state.extend MarkPlacer
  end

  def call
    @board_state.place_mark @number
  end
end
