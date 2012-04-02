require 'tic_tac_toe/data/win_position'

module TicTacToe
  module Minimax

    def best_position(depth = ply_number, depth_cutoff = self.size)
      return final_position(depth) if self.terminal?
      successor(depth, depth_cutoff) unless purge?(depth, depth_cutoff)
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

      def purge?(depth, depth_cutoff)
        depth_cutoff < depth
      end

      def successor(depth, depth_cutoff)
        best = nil
        self.empty_spaces.each do |s|
          n = next_position(s, depth, depth_cutoff)
          best = best(best, n)
          depth_cutoff = min_depth_for_X_to_win(best, depth_cutoff)
        end
        best
      end

        def next_position(space, depth, depth_cutoff)
          self.place_mark_at_index(space)
            self.take_turn
              position = self.best_position(depth + 1, depth_cutoff)
            self.take_turn
          self.undo_mark_at_index(space)
          position
        end

        def best(prev_position, next_position)
          final_positions = ([prev_position] + [next_position]).compact
          return final_positions.first if final_positions.length < 2
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

        def min_depth_for_X_to_win(win, depth_cutoff)
          if win and win.winner.X?
            win.ply_number
          else
            depth_cutoff
          end
        end

  end
end
