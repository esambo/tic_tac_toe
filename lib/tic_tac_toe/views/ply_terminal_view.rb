module TicTacToe
  module UI
    class PlyTerminalView

      def initialize(output, player)
        @output = output
        @player = player
      end

      def render
        @output.puts  ''
        @output.print 'Game over. '
        if @player.draw?
          @output.puts 'It was a draw!'
        else
          @output.puts "Player #{@player.to_s} won!"
        end
      end

    end
  end
end
