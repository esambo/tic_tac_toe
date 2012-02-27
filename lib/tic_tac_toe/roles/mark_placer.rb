module TicTacToe
  module MarkPlacer

    def place_mark(number)
      return valid_ply = false if move_taken?(number)
      place_mark_at_index(number.to_i - 1)
      take_turn
      valid_ply = true
    end

    private

      def move_taken?(number)
        !self.positions[number.to_i - 1].none?
      end

      def place_mark_at_index(i)
        self.positions[i] = self.next_player
        self.last_position_number = i + 1
      end

      def take_turn
        self.next_player = self.next_player.turn
      end
  end
end
