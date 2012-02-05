class BoardState
  attr_accessor :player, :positions, :length

  def initialize
    @length = 3
    @player = Player.X
    @positions = Array.new(size, Player.none)
  end

  def size
    @length * @length
  end
end
