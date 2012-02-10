module Minimax

  def best_position_number
    best_positions[:position_number]
  end

    def best_positions
      return final_position if self.terminal?
      final_positions = self.successors.map(&:best_positions)
      if self.next_player.X?
        best = max_for_X(final_positions)
      else
        best = min_for_O(final_positions)
      end
      best
    end

  private

      def final_position
        { :position_number => self.last_position_number,
          :player => self.winner.to_i
        }
      end

      def max_for_X(final_positions)
        final_positions.max_by { |h| h[:player] }
      end

      def min_for_O(final_positions)
        final_positions.min_by { |h| h[:player] }
      end
end
