class Game
  attr_reader   :marks, :positions, :length
  attr_accessor :player

  def initialize
    @length = 3
    @marks = 0
    @player = Player.x
    @positions = Array.new(size, Player.none)
  end

  def place_mark(number)
    @positions[number.to_i - 1] = @player
    update_status
  end

  def update_status
    @marks += 1
    take_turn
  end

  def take_turn
    @player = @player.turn
  end

  def draw?
    false
  end

  def size
    length * length
  end
end
