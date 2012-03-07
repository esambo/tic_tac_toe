module TicTacToe
  module UI
    class PlyController
      attr_writer :best_position_context_source, :place_mark_context_source
      attr_writer :length

      def initialize(output)
        @output = output
      end

      def ai_vs_human(board_state)
        @length = board_state.length
        render_board board_state.positions
        response = ai_ply(board_state)
      end

        def ai_ply(board_state)
          player_mark = Player.X.to_s
          best = best_position(board_state)
          number = best.next_position_number
          render_position player_mark, number
          response = place_mark board_state, number
          render_board response.positions
        end

      private

        def best_position(board_state)
          new_best_position_context(board_state).call
        end
          def new_best_position_context(board_state)
            best_position_context_source.call(board_state)
          end
            def best_position_context_source
              @best_position_context_source ||= BestPositionContext.public_method(:new)
            end

        def place_mark(board_state, number)
          new_place_mark_context(board_state, number).call
        end

          def new_place_mark_context(board_state, number)
            place_mark_context_source.call(board_state, number)
          end

            def place_mark_context_source
              @place_mark_context_source ||= PlaceMarkContext.public_method(:new)
            end

        def render_board(positions)
          presenter = PlyBoardPresenter.new positions, @length
          board     = presenter.call
          view      = PlyBoardView.new @output, board
          view.render
        end

        def render_position(player_mark, number)
          view = PlyPositionView.new @output, player_mark, number
          view.render
        end

    end
  end
end
