require 'tic_tac_toe/roles/winner'
require 'tic_tac_toe/roles/open_ply_finder'
require 'tic_tac_toe/roles/minimax'

module TicTacToe
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
end
