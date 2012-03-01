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
          @output.puts welcome_message
          @output.puts ''
        end

    end
  end
end
