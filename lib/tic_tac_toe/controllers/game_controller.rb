module TicTacToe
  module UI
    class GameController
      attr_writer :board_state_factory
      attr_writer :ply_controller_source
      attr_writer :game_start_view_source
      attr_reader :ply_controller

      def initialize(input, output)
        @input  = input
        @output = output
        @length = 3
      end

      def start
        render_welcome_message
        @ply_controller = new_ply_controller
        @ply_controller.ai_vs_human
      end

        def render_welcome_message
          message = 'Tic-Tac-Toe'
          view = new_game_start_view @output, message
          view.render
        end

      private

        def new_ply_controller
          ply_controller_source.call(@input, @output, @length, new_board_state)
        end

          def ply_controller_source
            @ply_controller_source ||= PlyController.public_method :new
          end

          def new_board_state
            board_state_factory.call
          end

            def board_state_factory
              @board_state_factory ||= BoardStateFactory.new @length
            end

        def new_game_start_view(output, message)
          game_start_view_source.call output, message
        end

          def game_start_view_source
            @game_start_view_source ||= GameStartView.public_method :new
          end

    end

  end
end
