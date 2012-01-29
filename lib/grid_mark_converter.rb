class GridMarkConverter
  
  def to_sequential_numbers(grid)
    to_sequential(grid).map { |mark|
      x?(mark) ? mark : find_letter_index(mark)
    }
  end

  def to_sequential(grid)
    result = []
    players_take_turns.each_with_index do |player, i|
      break if i >= grid.count
      space = find_next_mark(grid, player)
      result << next_mark_for_player(space, player) unless space.nil?
    end
    result
  end

  private

    def find_letter_index(letter)
      (find_next_mark(o_player_index, letter) + 1).to_s
    end

    def players_take_turns
      x_player_turns.zip(o_player_turns).flatten
    end

      def x_player_turns
        '1 2 3 4 5 6 7 8 9'.split
      end

      def o_player_turns
        'A B C D E F G H I'.split
      end

    def find_next_mark(grid, player)
      grid.find_index { |mark| mark == player }
    end

    def next_mark_for_player(space, player)
      value = x_player_index[space] if x? player
      value = o_player_index[space] if o? player
      value
    end

      def x_player_index
        ' 1 2 3
          4 5 6
          7 8 9'.split
      end

      def o_player_index
        ' A B C
          D E F
          G H I'.split
      end
      
    def x? player
      /^[1-9]$/ === player
    end

    def o? player
      /^[A-I]$/ === player
    end
end
