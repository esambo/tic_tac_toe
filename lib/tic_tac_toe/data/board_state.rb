module TicTacToe
  class BoardState
    attr_accessor :next_player, :positions, :sequence_numbers, :length

    def initialize(length, empty_space, first_player)
      @length = length
      @positions = Array.new(size, empty_space)
      @next_player = first_player
      @sequence_numbers = []
      @empty_space = empty_space
    end

    def size
      @length * @length
    end

    def place_mark_at_index(i)
      self.positions[i] = self.next_player
      self.sequence_numbers << i + 1
    end

    def undo_mark_at_index(i)
      self.positions[i] = @empty_space
      self.sequence_numbers.pop
    end

    def last_position_number
      self.sequence_numbers.last.to_i
    end

  end
end
