module Winner

  def winner
    return winners.first || (Player.draw if full?)
  end

  private

    def winners
      marks_to_win_positions.map { |line|
        line.group_by { |player|
          player
        }.delete_if { |player, marks|
          marks.count < self.length or player.none?
        }
      }.map(&:keys).flatten
    end

      def marks_to_win_positions
        win_positions.map { |line|
          line.map { |p|
            self.positions[p]
          }
        }
      end

        def win_positions
          rows = self.length.times.map { |row|
            Array.new(self.length)     { |col| col + (row * self.length) }
          }
          cols = self.length.times.map { |row|
            Array.new(self.length)     { |col| row + (col * self.length) }
          }
          diag1 = Array.new(self.length) { |col| (col * self.length) +               col }
          diag2 = Array.new(self.length) { |col| (col * self.length) + self.length - 1 - col }
          diags = [diag1] + [diag2]
          rows + cols + diags
        end

    def full?
      spaces = self.positions.count(Player.none)
      spaces == 0
    end
end
