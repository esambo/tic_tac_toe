module MarkPlacer

  def place_mark(number)
    return valid_ply = false if move_taken?(number)
    self.positions[number.to_i - 1] = self.next_player
    self.last_position_number = number.to_i
    take_turn
    valid_ply = true
  end

  private

    def move_taken?(number)
      !self.positions[number.to_i - 1].none?
    end

    def take_turn
      self.next_player = self.next_player.turn
    end
end
