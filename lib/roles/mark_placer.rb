module MarkPlacer

  def place_mark(number)
    return @valid_ply = false if move_taken?(number)
    @valid_ply = true
    @positions[number.to_i - 1] = @player
    take_turn
  end

  def move_taken?(number)
    !@positions[number.to_i - 1].none?
  end

  def take_turn
    @player = @player.turn
  end

  def valid_ply?
    @valid_ply
  end
end
