require 'tic_tac_toe/data/win_position'

module TicTacToe
  module Minimax

    def best_position
      return final_position if self.terminal?
      final_positions = self.successors.map(&:best_position)
      if self.next_player.X?
        best = max_for_X(final_positions)
      else
        best = min_for_O(final_positions)
      end
      best
    end

    private

      def final_position
        WinPosition.new.tap do |p|
          p.position_number = self.last_position_number
          p.winner          = self.winner
        end
      end

      def max_for_X(final_positions)
        final_positions.max_by { |p| p.winner.to_i }
      end

      def min_for_O(final_positions)
        final_positions.min_by { |p| p.winner.to_i }
      end
  end
end
