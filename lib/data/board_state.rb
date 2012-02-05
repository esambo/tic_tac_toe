class BoardState
  attr_accessor :player, :positions, :length

  def initialize(length, empty_space, first_player)
    @length = length
    @positions = Array.new(size, empty_space)
    @player = first_player
  end

  def size
    @length * @length
  end
end
