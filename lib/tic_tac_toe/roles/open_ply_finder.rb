module TicTacToe
  module OpenPlyFinder

    def successors
      next_board_states = []
      self.positions.each_with_index do |space, i|
        if space.none?
          next_board_state = deep_copy
          next_board_state.place_mark_at_index i
          next_board_state.take_turn
          next_board_states << next_board_state
        end
      end
      next_board_states
    end

      def deep_copy
        next_board_state = self.clone
        next_board_state.positions = self.positions.dup
        next_board_state
      end

  end
end
