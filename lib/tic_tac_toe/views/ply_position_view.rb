module TicTacToe
  module UI
    class PlyPositionView

      def initialize(output, number)
        @output = output
        @number = number
      end

      def render
        @output.puts ''
        @output.puts "#{@number}"
      end

    end
  end
end
