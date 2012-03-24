module TicTacToe
  module UI
    class PlyController
      attr_writer :ply_board_presenter_source
      attr_writer :ply_board_view_source, :ply_player_view_source, :ply_invalid_position_view_source
      attr_writer :ai_vs_human_service_source
      attr_writer :input
      attr_reader :board_state

      def initialize(input, output, length, board_state)
        @input       = input
        @output      = output
        @length      = length
        @board_state = board_state
      end

      def ai_vs_human
        @service = new_ai_vs_human_service

        register_callbacks

        start
      end

        def start
          @service.call
        end


          def get_position
            @input.getc
          end
          def render_board(positions)
            board = new_ply_board_presenter(positions, @length).call
            new_ply_board_view(@output, board).render
          end
          def render_player(player_mark, number)
            new_ply_player_view(@output, player_mark, number).render
          end
          def render_invalid_position
            new_ply_invalid_position_view(@output).render
          end
        def register_callbacks
          @service.on_get_position do |event|
            event.next
            get_position
          end

          @service.on_render_board do |event, positions|
            render_board positions
          end

          @service.on_render_player do |event, mark, number|
            render_player mark, number
          end

          @service.on_render_invalid_position do |event|
            render_invalid_position
          end
        end

        private

          def new_ai_vs_human_service
            ai_vs_human_service_source.call(board_state)
          end

            def ai_vs_human_service_source
              @ai_vs_human_service_source ||= AiVsHumanService.public_method :new
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

          def new_ply_player_view(output, player_mark, number)
            ply_player_view_source.call(output, player_mark, number)
          end

            def ply_player_view_source
              @ply_player_view_source ||= PlyPlayerView.public_method :new
            end

          def new_ply_invalid_position_view(output)
            ply_invalid_position_view_source.call(output)
          end

            def ply_invalid_position_view_source
              @ply_invalid_position_view_source ||= PlyInvalidPositionView.public_method :new
            end

    end
  end
end
