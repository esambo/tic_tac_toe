class BoardState
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

  def full?
    spaces = @positions.count(Player.none)
    spaces == 0
  end

  def winner
    return winners.first || (Player.draw if full?)
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
    diag1 = Array.new(@length) { |col| (col * @length) +               col }
    diag2 = Array.new(@length) { |col| (col * @length) + @length - 1 - col }
    diags = [diag1] + [diag2]
    rows + cols + diags
  end
end
