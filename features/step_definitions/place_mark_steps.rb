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


def grid_sequence_to_win_for_current_player
  @player.X? ? win_X_grid_sequence : win_O_grid_sequence
end


def data_table_to_board(data_table)
  data_table.raw.flatten
end


def new_board_state
  @board_state = BoardState.new 3, Player.none, Player.X
end

def place_board_with_single_mark(board)
  place_mark_context board_to_next_mark_number(board)
end

  def board_to_next_mark_number(board)
    numbers = []
    board.each_with_index do |space, i|
      numbers << i + 1 unless space.empty?
    end
    numbers.first
  end

def place_board_with_alternating_marks(board)
  numbers_by_marks = board_to_numbers_by_marks(board)
  alternating_mark_sequence = numbers_by_marks_to_alternating_mark_sequence(numbers_by_marks)
  alternating_mark_sequence.each do |mark|
    place_mark_context mark
  end
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

def place_alternating_sequence_numbers(sequence)
  BoardMarkConverter.new.to_alternating_sequence_numbers(sequence).each do |number|
    place_mark_context number
  end
end

def place_mark_context(number)
  context = PlaceMarkContext.new(@board_state, number)
  @response_set = context.call
end

def winner
  @response_set.winner
end

def place_best_position
  number = get_best_position.position_number
  place_mark_context number
end

  def get_best_position
    BestPositionContext.new(@board_state).call
  end

def positions_to_board(positions)
  positions.map(&:to_s)
end

def board_to_raw_table(board, groups_of_length)
  board = clean_empty_spaces(board)
  groups_of_length.times.map{ |i| board[i * groups_of_length, groups_of_length] }
end

  def clean_empty_spaces(board)
    board.map(&:strip)
  end

def board_to_win_position(board)
  board.each_with_index do |space, i|
    return WinPosition.new(i + 1, Player.X) if space == 'X'
  end
end

def clear_win_position(board)
  board.tap do |board|
    board[@win_position.position_number - 1] = '_'
  end
end


Given /^an empty board$/ do
  new_board_state
end

Given /^a board state$/ do
  new_board_state
end

Given /^I am the first player "([^\"]+)"$/ do |mark|
  new_board_state
  @player = Player.new mark
end

Given /^the grid:$/ do |data_table|
  new_board_state
  board = data_table_to_board(data_table)
  place_board_with_alternating_marks board
end

Given /^the grid sequence with the indicated winning mark X:$/ do |data_table|
  new_board_state
  board = data_table_to_board(data_table)
  @win_position = board_to_win_position(board)
  board = clear_win_position(board)
  place_alternating_sequence_numbers board
end

When /^I place the mark:$/ do |data_table|
  board = data_table_to_board(data_table)
  place_board_with_single_mark board
end

When /^I win$/ do
  place_alternating_sequence_numbers grid_sequence_to_win_for_current_player
end

When /^the board is full without a win$/ do
  place_alternating_sequence_numbers draw_grid_sequence
end

When /^the AI places its best position$/ do
  place_best_position
end

When /^the AI analyzes the best position$/ do
  @best_position = get_best_position
end

Then /^"([^"]*)" should "([^"]*)"$/ do |mark, outcome|
  winner.should     == Player.new(mark) if outcome == 'win'
  winner.should_not == Player.new(mark) if outcome == 'lose'
end

Then /^the game should be a draw$/ do
  winner.should == Player.draw
end

Then /^I should see the grid:$/ do |data_table|
  board = positions_to_board(@response_set.positions)
  raw_table = board_to_raw_table(board, @board_state.length)
  raw_table.should == data_table.raw
end

Then /^"([^\"]+)" should be the next player$/ do |mark|
  @response_set.next_player.should == Player.new(mark)
end

Then /^the last placed mark should not be valid$/ do
  @response_set.valid_ply.should == false
end

Then /^the game should at least be a (\w+)$/ do |game_state|
  if game_state == 'win'
    player = Player.X
  else
    player = Player.draw
  end
  @best_position.winner.should == player
end

Then /^it should be at the indicated position$/ do
  @board_state.last_position_number.should == @win_position.position_number.should
end
