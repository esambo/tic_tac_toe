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


def place_board_with_single_mark(board)
  place_mark board_to_next_mark_number(board)
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
    place_mark mark
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
  BoardMarkConverter.new.to_alternating_sequence_numbers(sequence).each do |mark|
    place_mark mark
  end
end

def place_mark(mark)
  @board_state.place_mark mark
end


def positions_to_board(positions)
  positions.map(&:to_s)
end

def board_to_raw_table(board, groups_of_length)
  groups_of_length.times.map{ |i| board[i * groups_of_length, groups_of_length] }
end


Given /^a board state$/ do
  @board_state = BoardState.new
end

Given /^I am the first player "([^\"]+)"$/ do |mark|
  @board_state = BoardState.new
  @player = Player.new mark
end

Given /^the grid:$/ do |data_table|
  @board_state = BoardState.new
  board = data_table_to_board(data_table)
  place_board_with_alternating_marks board
end

Given /^the grid sequence:$/ do |data_table|
  @board_state = BoardState.new
  board = data_table_to_board(data_table)
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

Then /^"([^"]*)" should "([^"]*)"$/ do |mark, outcome|
  @board_state.winner.should     == Player.new(mark) if outcome == 'win'
  @board_state.winner.should_not == Player.new(mark) if outcome == 'lose'
end

Then /^the game should be a draw$/ do
  @board_state.winner.should == Player.draw
end

Then /^I should see the grid:$/ do |data_table|
  board = positions_to_board(@board_state.positions)
  raw_table = board_to_raw_table(board, @board_state.length)
  data_table.raw.should == raw_table
end

Then /^"([^\"]+)" should be the current player$/ do |mark|
  @board_state.player.should == Player.new(mark)
end

Then /^the last placed mark should not be valid$/ do
  @board_state.should_not be_valid_ply
end
