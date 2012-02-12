class BoardState
  attr_accessor :next_player, :positions, :last_position_number, :length

  def initialize(length, empty_space, first_player)
    @length = length
    @positions = Array.new(size, empty_space)
    @next_player = first_player
  end

  def size
    @length * @length
  end
end
