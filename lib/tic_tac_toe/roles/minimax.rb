require 'tic_tac_toe/data/win_position'

module TicTacToe
  module Minimax

    def best_position(depth = nil)
      depth ||= ply_number
      return final_position(depth) if self.terminal?
      final_positions = self.successors.map { |s| s.best_position(depth + 1) }
      if self.next_player.X?
        best = max_for_X(final_positions)
      else
        best = min_for_O(final_positions)
      end
      best.position_number = self.last_position_number
      best
    end

    private

      def ply_number
        self.positions.count { |p| !p.none? }
      end

      def final_position(depth)
        WinPosition.new.tap do |p|
          p.position_number = self.last_position_number
          p.ply_number      = depth
          p.rank            = rank(winner, depth)
          p.winner          = self.winner
        end
      end

      def rank(winner, depth)
        (self.size - depth + 1) * winner.to_i
      end

      def max_for_X(final_positions)
        final_positions.max_by { |p| p.rank }
      end

      def min_for_O(final_positions)
        final_positions.min_by { |p| p.rank }
      end

  end
end
