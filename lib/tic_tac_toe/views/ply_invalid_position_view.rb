module TicTacToe
  module UI
    class PlyInvalidPositionView

      def initialize(output)
        @output = output
      end

      def render
        @output.puts ''
        @output.puts 'Invalid position number! Please try again...'
      end

    end
  end
end
