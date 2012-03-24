module TicTacToe
  module UI
    class PlyPlayerView

      def initialize(output, player_mark)
        @output      = output
        @player_mark = player_mark
      end

      def render
        @output.puts ''
        @output.print "#{@player_mark} player position number: "
      end

    end
  end
end
