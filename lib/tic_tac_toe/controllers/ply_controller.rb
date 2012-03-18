module TicTacToe
  module UI
    class PlyController
      attr_writer :best_position_context_source, :place_mark_context_source
      attr_writer :ply_board_presenter_source
      attr_writer :ply_board_view_source, :ply_position_view_source
      attr_writer :ai_vs_human_strategy_source
      attr_writer :input
      attr_reader :board_state

      def initialize(input, output, length, board_state)
        @input       = input
        @output      = output
        @length      = length
        @board_state = board_state
      end

      def ai_vs_human
        ai_vs_human_strategy
      end

        def ai_vs_human_strategy
          new_ai_vs_human_strategy.call
        end

        def get_position
          @input.getc
        end

        def best_position
          new_best_position_context.call
        end

        def place_mark(number)
          new_place_mark_context(number).call
        end

        def render_board(positions)
          board = new_ply_board_presenter(positions, @length).call
          new_ply_board_view(@output, board).render
        end

        def render_position(player_mark, number)
          new_ply_position_view(@output, player_mark, number).render
        end

        private

          def new_ai_vs_human_strategy
            ai_vs_human_strategy_source.call(self)
          end

            def ai_vs_human_strategy_source
              @ai_vs_human_strategy_source ||= AiVsHumanStrategy.public_method :new
            end

          def new_best_position_context
            best_position_context_source.call(@board_state)
          end

            def best_position_context_source
              @best_position_context_source ||= BestPositionContext.public_method :new
            end

          def new_place_mark_context(number)
            place_mark_context_source.call(@board_state, number)
          end

            def place_mark_context_source
              @place_mark_context_source ||= PlaceMarkContext.public_method :new
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

          def new_ply_position_view(output, player_mark, number)
            ply_position_view_source.call(output, player_mark, number)
          end

            def ply_position_view_source
              @ply_position_view_source ||= PlyPositionView.public_method :new
            end

    end
  end
end
