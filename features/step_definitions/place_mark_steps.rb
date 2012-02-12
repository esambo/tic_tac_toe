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

def board_to_win_position(board)
  board.each_with_index do |space, i|
    if space == 'X'
      return TicTacToe::WinPosition.new(i + 1, TicTacToe::Player.X)
    end
  end
end

def clear_win_position(board, win_position)
  board.tap do |board|
    board[win_position.position_number - 1] = '_'
  end
end



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


Given /^an empty board$/ do
  @board_state = new_board_state
end

Given /^a board state$/ do
  @board_state = new_board_state
end

Given /^I am the first player "([^\"]+)"$/ do |mark|
  @board_state = new_board_state
  @player = TicTacToe::Player.new mark
end

Given /^the grid:$/ do |data_table|
  @board_state = new_board_state
  board = data_table_to_board(data_table)
  place_board_with_alternating_marks @board_state, board
end

Given /^the grid sequence with the indicated winning mark X:$/ do |data_table|
  @board_state = new_board_state
  board = data_table_to_board(data_table)
  @win_position = board_to_win_position(board)
  board = clear_win_position(board, @win_position)
  place_alternating_sequence_numbers @board_state, board
end

When /^I place the mark:$/ do |data_table|
  board = data_table_to_board(data_table)
  @response_set = place_board_with_single_mark @board_state, board
end

When /^I win$/ do
  grid_sequence = grid_sequence_to_win_for_player(@player)
  @response_set = place_alternating_sequence_numbers @board_state, grid_sequence
end

When /^the board is full without a win$/ do
  @response_set = place_alternating_sequence_numbers @board_state, draw_grid_sequence
end

When /^the AI places its best position$/ do
  @response_set = place_best_position(@board_state)
end

When /^the AI analyzes the best position$/ do
  @best_position = get_best_position(@board_state)
end

Then /^"([^"]*)" should "([^"]*)"$/ do |mark, outcome|
  @response_set.winner.should     == TicTacToe::Player.new(mark) if outcome == 'win'
  @response_set.winner.should_not == TicTacToe::Player.new(mark) if outcome == 'lose'
end

Then /^the game should be a draw$/ do
  @response_set.winner.should == TicTacToe::Player.draw
end

Then /^I should see the grid:$/ do |data_table|
  board = positions_to_board(@response_set.positions)
  raw_table = board_to_raw_table(board, @board_state.length)
  raw_table.should == data_table.raw
end

Then /^"([^\"]+)" should be the next player$/ do |mark|
  @response_set.next_player.should == TicTacToe::Player.new(mark)
end

Then /^the last placed mark should not be valid$/ do
  @response_set.valid_ply.should == false
end

Then /^the game should at least be a (\w+)$/ do |game_state|
  if game_state == 'win'
    player = TicTacToe::Player.X
  else
    player = TicTacToe::Player.draw
  end
  @best_position.winner.should == player
end

Then /^it should be at the indicated position$/ do
  @board_state.last_position_number.should == @win_position.position_number.should
end
