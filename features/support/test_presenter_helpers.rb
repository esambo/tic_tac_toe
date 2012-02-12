module TestPresenterHelpers

  def positions_to_board(positions)
    positions.map(&:to_s)
  end

  def board_to_raw_table(board, groups_of_length)
    board = clean_empty_spaces(board)
    groups_of_length.times.map{ |i|
      board[i * groups_of_length, groups_of_length]
    }
  end

    def clean_empty_spaces(board)
      board.map(&:strip)
    end
end

World TestPresenterHelpers
