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

def board_to_next_mark_number(board)
  numbers = []
  board.each_with_index do |space, i|
    numbers << i + 1 unless space.empty?
  end
  numbers.first
end

def positions_to_board(positions)
  positions.map(&:to_s)
end

def board_to_raw_table(board, groups_of_length)
  groups_of_length.times.map{ |i| board[i * groups_of_length, groups_of_length] }
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

Given /^a game$/ do
  @game = Game.new
end

Given /^I am the first player "([^\"]+)"$/ do |mark|
  @game = Game.new
  @player = Player.new mark
end

Given /^the grid:$/ do |data_table|
  @game = Game.new
  board = data_table_to_board(data_table)
  numbers_by_marks = board_to_numbers_by_marks(board)
  alternating_mark_sequence = numbers_by_marks_to_alternating_mark_sequence(numbers_by_marks)
  alternating_mark_sequence.each do |mark|
    @game.place_mark mark
  end
end

Given /^the grid sequence:$/ do |data_table|
  @game = Game.new
  board = data_table_to_board(data_table)
  GridMarkConverter.new.to_sequential_numbers(board).each do |mark|
    @game.place_mark mark
  end
end

When /^I place the mark:$/ do |data_table|
  board = data_table_to_board(data_table)
  @game.place_mark board_to_next_mark_number(board)
end

When /^I win$/ do
  grid_sequence = grid_sequence_to_win_for_current_player
  GridMarkConverter.new.to_sequential_numbers(grid_sequence).each do |mark|
    @game.place_mark mark
  end
end

When /^the board is full without a three in a row$/ do
  grid_sequence = draw_grid_sequence
  GridMarkConverter.new.to_sequential_numbers(grid_sequence).each do |mark|
    @game.place_mark mark
  end
end

Then /^"([^"]*)" should "([^"]*)"$/ do |mark, outcome|
  @game.winner.should     == Player.new(mark) if outcome == 'win'
  @game.winner.should_not == Player.new(mark) if outcome == 'lose'
end

Then /^the game should be a draw$/ do
  @game.winner.should == Player.draw
end

Then /^I should see the grid:$/ do |data_table|
  board = positions_to_board(@game.positions)
  raw_table = board_to_raw_table(board, @game.length)
  data_table.raw.should == raw_table
end

Then /^"([^\"]+)" should be the current player$/ do |mark|
  @game.player.should == Player.new(mark)
end

Then /^the last placed mark should not be valid$/ do
  @game.should_not be_valid_ply
end
