module TicTacToe
  module UI
    class PlyPositionView

      def initialize(output, player_mark, number)
        @output      = output
        @player_mark = player_mark
        @number      = number
      end

      def render
        @output.puts ''
        @output.puts "#{@player_mark} player ply position number: #{@number}"
      end

    end
  end
end
