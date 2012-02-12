require 'roles/winner'
require 'roles/open_ply_finder'
require 'roles/minimax'

class BestPositionContext
  attr_reader :board_state

  def initialize(board_state)
    @board_state = board_state
  end

  def call
    get_best_position
  end

  private

    def get_best_position
      @board_state.extend Winner
      @board_state.extend OpenPlyFinder
      @board_state.extend Minimax
      @board_state.best_position
    end
end
