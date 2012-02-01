class Game
  attr_reader :player, :positions, :length

  def initialize
    @length = 3
    @player = Player.X
    @positions = Array.new(size, Player.none)
  end

  def size
    length * length
  end

  def place_mark(number)
    return @valid_move = false if move_taken?(number)
    @valid_move = true
    @positions[number.to_i - 1] = @player
    take_turn
  end

  def move_taken?(number)
    !@positions[number.to_i - 1].none?
  end

  def take_turn
    @player = @player.turn
  end

  def valid_move?
    @valid_move
  end

  def winner
    return winners.first || Player.draw
  end

  def winners
    marks_to_win_positions.map { |line|
      line.group_by { |player|
        player
      }.delete_if { |k, v|
        v.count < @length
      }
    }.map(&:keys).flatten
  end

  def marks_to_win_positions
    win_positions.map { |line|
      line.map { |p|
        @positions[p]
      }
    }
  end

  def win_positions
    rows = @length.times.map { |row|
      Array.new(@length)     { |col| col + (row * @length) }
    }
    cols = @length.times.map { |row|
      Array.new(@length)     { |col| row + (col * @length) }
    }
    diags = [[0, 4, 8], [2, 4, 6]]
    rows + cols + diags
  end
end
