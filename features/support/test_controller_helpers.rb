module TestControllerHelpers

  def draw_grid_sequence
    ' 1 2 B
      C A 4
      3 D 5'.split
  end

  def win_X_grid_sequence
    ' 1 A B
      2 _ _
      3 _ _'.split
  end

  def win_O_grid_sequence
    ' A B C
      2 1 _
      3 _ _'.split
  end


  def grid_sequence_to_win_for_player(player)
    player.X? ? win_X_grid_sequence : win_O_grid_sequence
  end


  def data_table_to_board(data_table)
    data_table.raw.flatten
  end


  def new_board_state
    board_state = TicTacToe::BoardState.new(
                    3,
                    TicTacToe::Player.none,
                    TicTacToe::Player.X
                  )
  end

  def place_board_with_single_mark(board_state, board)
    response_set = place_mark_context(
                     board_state,
                     board_to_next_mark_number(board)
                   )
  end

    def board_to_next_mark_number(board)
      numbers = []
      board.each_with_index do |space, i|
        numbers << i + 1 unless space.empty?
      end
      numbers.first
    end

  def place_board_with_alternating_marks(board_state, board)
    response_set = nil
    numbers_by_marks = board_to_numbers_by_marks(board)
    alt_mark_seq = numbers_by_marks_to_alternating_mark_sequence(
                     numbers_by_marks
                  )
    alt_mark_seq.each do |mark|
      response_set = place_mark_context board_state, mark
    end
    response_set
  end

    def board_to_numbers_by_marks(board)
      marks = {'X' => [], 'O' => []}
      board.each_with_index do |space, i|
        marks[space] << i + 1 unless space.empty?
      end
      marks
    end

    def numbers_by_marks_to_alternating_mark_sequence(numbers_by_marks)
      numbers_by_marks['X'].zip(numbers_by_marks['O']).flatten.compact
    end

  def place_alternating_sequence_numbers(board_state, sequence)
    response_set = nil
    bmc = TicTacToe::BoardMarkConverter.new
    bmc.to_alternating_sequence_numbers(sequence).each do |number|
      response_set = place_mark_context board_state, number
    end
    response_set
  end

  def place_best_position(board_state)
    number = get_best_position(board_state).position_number
    response_set = place_mark_context board_state, number
  end

    def get_best_position(board_state)
      TicTacToe::BestPositionContext.new(board_state).call
    end

    def place_mark_context(board_state, number)
      context = TicTacToe::PlaceMarkContext.new(board_state, number)
      response_set = context.call
    end

  def board_to_win_number(board, winning_mark)
    board.each_with_index do |space, i|
      if space == winning_mark
        return i + 1
      end
    end
  end

  def clear_win_number(board, win_number)
    board.tap do |board|
      board[win_number - 1] = '_'
    end
  end
end

World TestControllerHelpers
