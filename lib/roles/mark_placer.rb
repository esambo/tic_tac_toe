module MarkPlacer

  def place_mark(number)
    return @valid_ply = false if move_taken?(number)
    @valid_ply = true
    self.positions[number.to_i - 1] = self.player
    take_turn
  end

  def move_taken?(number)
    !self.positions[number.to_i - 1].none?
  end

  def take_turn
    self.player = self.player.turn
  end

  def valid_ply?
    @valid_ply
  end
end
