module TicTacToe
  module UI
    class GameStartView

      def initialize(output, view_model)
        @output     = output
        @view_model = view_model
      end

      def render
        @output.puts @view_model.welcome_message
        @output.puts ''
      end

    end
  end
end
