module TicTacToe
  module UI
    class PlyTerminalView

      def initialize(output, player)
        @output = output
        @player = player
      end

      def render
        @output.puts ''
        @output.puts "Game over. Player #{@player.to_s} won!"
      end

    end
  end
end
