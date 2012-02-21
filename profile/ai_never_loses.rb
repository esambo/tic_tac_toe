$: << File.expand_path(File.join(File.dirname(__FILE__), %w(.. lib)))

require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/contexts/best_position_context'

module TicTacToe
  class AiNeverLoses
    def call
      next_player = Player.X
      space       = Player.none
      board_state = BoardState.new 3, space, next_player
      context     = BestPositionContext.new board_state
      context.call
    end
  end
end
