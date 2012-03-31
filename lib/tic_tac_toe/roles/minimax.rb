require 'tic_tac_toe/data/win_position'

module TicTacToe
  module Minimax

    def best_position(depth = ply_number)
      return final_position(depth) if self.terminal?
      successor(depth)
    end

    private

      def ply_number
        mark_best_position_start
        self.positions.count { |p| !p.none? }
      end

        def mark_best_position_start
          self.sequence_numbers << ' '
        end

      def final_position(depth)
        WinPosition.new.tap do |p|
          p.path       = self.sequence_numbers.join
          p.ply_number = depth
          p.rank       = rank(winner, depth)
          p.winner     = self.winner
        end
      end

        def rank(winner, depth)
          (self.size - depth + 1) * winner.to_i
        end

      def successor(depth)
        best = nil
        self.empty_spaces.each do |s|
          n = next_position(s, depth)
          best = best(best, n)
        end
        best
      end

        def next_position(space, depth)
          self.place_mark_at_index(space)
            self.take_turn
              position = self.best_position(depth + 1)
            self.take_turn
          self.undo_mark_at_index(space)
          position
        end

        def best(prev_position, next_position)
          return next_position if prev_position.nil?
          final_positions = [prev_position] + [next_position]
          best = nil
          if self.next_player.X?
            best = max_for_X(final_positions)
          else
            best = min_for_O(final_positions)
          end
          best
        end

          def max_for_X(final_positions)
            final_positions.max_by { |p| p.rank }
          end

          def min_for_O(final_positions)
            final_positions.min_by { |p| p.rank }
          end

  end
end
