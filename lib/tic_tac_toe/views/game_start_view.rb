module TicTacToe
  module UI
    class GameStartView

      def initialize(output, positions)
        @output    = output
        @positions = positions
      end

      def render
        @output.puts 'Tic-Tac-Toe'
        @output.puts ''
        @output.puts 'Directions:'
        @output.puts 'Please use following position numbers when placing your mark:'
        @output.puts @positions
        @output.puts ''
      end

    end
  end
end
