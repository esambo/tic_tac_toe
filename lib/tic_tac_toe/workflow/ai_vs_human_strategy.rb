require 'forwardable'

module TicTacToe
  module UI
    class AiVsHumanStrategy
      extend Forwardable

      def initialize(ply)
        @ply = ply
      end

      def_delegators :@ply,
          :render_board, :render_position,
          :get_position,
          :place_mark, :best_position,
          :board_state, :response

      def call
        render_board(board_state.positions)
        ai_ply
        human_ply
      end

      private

        def ai_ply
          player_mark = Player.X.to_s
          best        = best_position
                        render_position(player_mark, best.next_position_number)
          response    = place_mark(best.next_position_number)
                        render_board(response.positions)
        end

        def human_ply
          player_mark = Player.O.to_s
                        render_position(player_mark, nil)
          position    = get_position
          response    = place_mark(position)
                        render_board(response.positions)
        end

    end
  end
end
