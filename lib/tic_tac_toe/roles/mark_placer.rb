module TicTacToe
  module MarkPlacer

    def place_mark(number)
      return valid_ply = false if out_of_range(number) or move_taken?(number)
      self.place_mark_at_index(number.to_i - 1)
      valid_ply = true
    end

    private

      def move_taken?(number)
        !self.positions[number.to_i - 1].none?
      end

      def out_of_range(number)
        number.to_i <= 0 || number.to_i > self.positions.length
      end

  end
end
