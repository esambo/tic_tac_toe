module TicTacToe
  module UI
    class PlyPlayerView

      def initialize(output, player_mark, number)
        @output      = output
        @player_mark = player_mark
        @number      = number
      end

      def render
        @output.puts ''
        @output.print "#{@player_mark} player position number: #{@number}"
        @output.print "\n" unless @number.nil?
      end

    end
  end
end
