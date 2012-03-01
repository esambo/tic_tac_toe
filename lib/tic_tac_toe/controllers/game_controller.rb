module TicTacToe
  module UI
    class GameController

      def initialize(output)
        @output = output
      end

      def start
        render_welcome_message
      end

      private

        def render_welcome_message
          welcome_message = 'Tic-Tac-Toe'
          view_model = GameStartViewModel.new(welcome_message)
          view = GameStartView.new(@output, view_model)
          view.render
        end

    end
  end
end
