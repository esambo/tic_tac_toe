class Game
  attr_accessor :player

  def initialize
    @player = Player.x
  end

  def place_mark(number)
    take_turn
  end

  def take_turn
    @player = @player.turn
  end

  def possitions
    []
  end
end
