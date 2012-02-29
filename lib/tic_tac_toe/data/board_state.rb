module TicTacToe
  class BoardState
    attr_accessor :next_player, :positions, :last_position_number, :length

    def initialize(length, empty_space, first_player)
      @length = length
      @positions = Array.new(size, empty_space)
      @next_player = first_player
      @last_position_number = 0
    end

    def size
      @length * @length
    end

    def place_mark_at_index(i)
      self.positions[i] = self.next_player
      self.last_position_number = i + 1
    end

  end
end
