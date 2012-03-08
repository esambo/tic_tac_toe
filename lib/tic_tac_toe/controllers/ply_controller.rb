module TicTacToe
  module UI
    class PlyController
      attr_writer :best_position_context_source, :place_mark_context_source
      attr_writer :ply_board_presenter_source
      attr_writer :ply_board_view_source, :ply_position_view_source

      def initialize(output, length)
        @output = output
        @length = length
      end

      def ai_vs_human(board_state)
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
          board = new_ply_board_presenter(positions, @length).call
          new_ply_board_view(@output, board).render
        end

          def new_ply_board_presenter(positions, length)
            ply_board_presenter_source.call(positions, length)
          end

            def ply_board_presenter_source
              @ply_board_presenter_source ||= PlyBoardPresenter.public_method :new
            end

          def new_ply_board_view(output, board)
            ply_board_view_source.call(output, board)
          end

            def ply_board_view_source
              @ply_board_view_source ||= PlyBoardView.public_method :new
            end

        def render_position(player_mark, number)
          new_ply_position_view(@output, player_mark, number).render
        end

          def new_ply_position_view(output, player_mark, number)
            ply_position_view_source.call(output, player_mark, number)
          end

            def ply_position_view_source
              @ply_position_view_source ||= PlyPositionView.public_method :new
            end

    end
  end
end
