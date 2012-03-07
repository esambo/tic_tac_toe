module TicTacToe
  module UI
    class PlyBoardView

      def initialize(output, board)
        @output = output
        @board  = board
      end

      def render
        @output.puts ''
        @board.each_line do |line|
          @output.puts line.chomp
        end
      end

    end
  end
end
