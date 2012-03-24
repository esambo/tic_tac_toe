require 'hookr'

module TicTacToe
  class AiVsHumanService
    include HookR::Hooks
    define_hook :on_render_board, :positions
    define_hook :on_render_position, :mark, :number
    define_hook :on_render_invalid_position
    define_hook :on_get_position
    attr_writer :best_position_context_source, :place_mark_context_source

    def initialize(board_state)
      @board_state = board_state
    end

    def call
      render_board(@board_state.positions)
      ai_ply
      human_ply
    end

      def ai_ply
        mark     = Player.X.to_s
        best     = best_position
                   render_position(mark, best.next_position_number)
        response = place_mark(best.next_position_number)
                   render_board(response.positions)
      end

      def human_ply
        begin
          mark     = Player.O.to_s
                     render_position(mark, nil)
          position = get_position
          response = place_mark(position)
                     render_invalid_position unless response.valid_ply
        end until response.valid_ply
        render_board(response.positions)
      end

      private

        def render_board(positions)
          execute_hook :on_render_board, positions
        end

        def render_position(mark, number)
          execute_hook :on_render_position, mark, number
        end

        def render_invalid_position
          execute_hook :on_render_invalid_position
        end

        def get_position
          position = execute_hook :on_get_position do end
        end

        def best_position
          new_best_position_context.call
        end

          def new_best_position_context
            best_position_context_source.call(@board_state)
          end

            def best_position_context_source
              @best_position_context_source ||= BestPositionContext.public_method :new
            end

        def place_mark(number)
          new_place_mark_context(number).call
        end

          def new_place_mark_context(number)
            place_mark_context_source.call(@board_state, number)
          end

            def place_mark_context_source
              @place_mark_context_source ||= PlaceMarkContext.public_method :new
            end

  end
end
