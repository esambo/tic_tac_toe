class BoardState
  attr_reader :player, :positions, :length
  include MarkPlacer
  include Winner

  def initialize
    @length = 3
    @player = Player.X
    @positions = Array.new(size, Player.none)
  end

  def size
    length * length
  end
end
