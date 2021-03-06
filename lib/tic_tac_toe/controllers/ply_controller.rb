module TicTacToe
  module UI
    class PlyController
      attr_writer :board_presenter_source
      attr_writer :ply_board_view_source
      attr_writer :ply_player_view_source
      attr_writer :ply_position_view_source
      attr_writer :ply_invalid_position_view_source
      attr_writer :ply_terminal_view_source
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
            @input.gets.chomp
          end
          def render_board(positions)
            board = new_board_presenter(positions, @length).call
            new_ply_board_view(@output, board).render
          end
          def render_player(player_mark)
            new_ply_player_view(@output, player_mark).render
          end
          def render_position(number)
            new_ply_position_view(@output, number).render
          end
          def render_invalid_position
            new_ply_invalid_position_view(@output).render
          end
          def render_terminal(player)
            new_ply_terminal_view(@output, player).render
          end
        def register_callbacks
          @service.on_get_position do |event|
            event.next
            get_position
          end

          @service.on_render_board do |event, positions|
            render_board positions
          end

          @service.on_render_player do |event, mark|
            render_player mark
          end

          @service.on_render_position do |event, number|
            render_position number
          end

          @service.on_render_invalid_position do |event|
            render_invalid_position
          end

          @service.on_render_terminal do |event, player|
            render_terminal player
          end
        end

        private

          def new_ai_vs_human_service
            ai_vs_human_service_source.call(board_state)
          end

            def ai_vs_human_service_source
              @ai_vs_human_service_source ||= AiVsHumanService.public_method :new
            end

          def new_board_presenter(positions, length)
            board_presenter_source.call(positions, length)
          end

            def board_presenter_source
              @board_presenter_source ||= BoardPresenter.public_method :new
            end

          def new_ply_board_view(output, board)
            ply_board_view_source.call(output, board)
          end

            def ply_board_view_source
              @ply_board_view_source ||= PlyBoardView.public_method :new
            end

          def new_ply_player_view(output, player_mark)
            ply_player_view_source.call(output, player_mark)
          end

            def ply_player_view_source
              @ply_player_view_source ||= PlyPlayerView.public_method :new
            end

          def new_ply_position_view(output, number)
            ply_position_view_source.call(output, number)
          end

            def ply_position_view_source
              @ply_position_view_source ||= PlyPositionView.public_method :new
            end

          def new_ply_invalid_position_view(output)
            ply_invalid_position_view_source.call(output)
          end

            def ply_invalid_position_view_source
              @ply_invalid_position_view_source ||= PlyInvalidPositionView.public_method :new
            end

          def new_ply_terminal_view(output, player)
            ply_terminal_view_source.call(output, player)
          end

            def ply_terminal_view_source
              @ply_terminal_view_source ||= PlyTerminalView.public_method :new
            end

    end
  end
end
