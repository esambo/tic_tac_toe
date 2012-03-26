require 'tic_tac_toe/board_mark_converter'

module TicTacToe
  module Helpers

    def board_of_marks_to_sequental_players(grid_of_string_marks)
      grid_of_string_marks.split.map { |mark| Player.new mark }
    end

    def setup_board_state(sequence)
      setup_players(
        BoardMarkConverter.new.to_alternating_sequence_numbers(sequence)
      )
    end

    private

      def setup_players(alternating_sequence_numbers)
        player = Player.X
        alternating_sequence_numbers.each do |number|
          board_state.place_mark_at_index(number.to_i - 1)
          player = player.turn
          board_state.next_player = player
        end
      end

  end
end
