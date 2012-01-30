class Game
  attr_reader   :marks, :positions, :length
  attr_accessor :player

  def initialize
    @length = 3
    @marks = 0
    @player = Player.X
    @positions = Array.new(size, Player.none)
  end

  def place_mark(number)
    @positions[number.to_i - 1] = @player
    @marks += 1
    take_turn
  end

  def take_turn
    @player = @player.turn
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

  def marks_to_win_positions
    players_in_win_positions = []
    win_positions.map { |line|
      line.map { |p|
        @positions[p]
      }
    }
  end

  def size
    length * length
  end
end
