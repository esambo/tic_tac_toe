module TicTacToe
  module UI
    class GameStartView

      def initialize(output, message)
        @output  = output
        @message = message
      end

      def render
        @output.puts @message
      end

    end
  end
end
