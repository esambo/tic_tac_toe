def draw_grid
  ' 1 2 B
    C A 4
    3 D 5'.split
end

def win_X_grid
  ' 1 A B
    2 _ _
    3 _ _'.split
end

def win_O_grid
  ' A B C
    2 1 _
    3 _ _'.split
end

def mark_number(board)
  index = []
  board.each_with_index do |player, i|
    index << i + 1 unless player.empty?
  end
  index.first
end

def players_to_board(positions)
  positions.map(&:to_s)
end

def list_to_grid(list, groups_of)
  groups_of.times.map{ |i| list[i * groups_of, groups_of] }
end

def board_to_marks(board)
  marks = {'X' => [], 'O' => []}
  board.each_with_index do |space, i|
    marks[space] << i + 1 unless space.empty?
  end
  marks
end

def marks_in_sequence(marks_by_player)
  marks_by_player['X'].zip(marks_by_player['O']).flatten.compact
end

Given /^a game$/ do
  @game = Game.new
end

Given /^I am the first player "([^\"]+)"$/ do |player|
  @game = Game.new
  @player = Player.new player
end

Given /^the positions:$/ do |table|
  @game = Game.new
  board = table.raw.flatten
  marks_by_player = board_to_marks(board)
  placeable_marks = marks_in_sequence(marks_by_player)
  placeable_marks.each do |mark|
    @game.place_mark mark
  end
end

Given /^the sequential positions:$/ do |table|
  @game = Game.new
  board = table.raw.flatten
  GridMarkConverter.new.to_sequential_numbers(board).each do |space|
    @game.place_mark space
  end
end

When /^I place the mark:$/ do |table|
  board = table.raw.flatten
  @game.place_mark mark_number(board)
end

When /^I win$/ do
  sequence = @player.X? ? win_X_grid : win_O_grid
  GridMarkConverter.new.to_sequential_numbers(sequence).each do |space|
    @game.place_mark space
  end
end

When /^the board is full without a three in a row$/ do
  sequence = draw_grid
  GridMarkConverter.new.to_sequential_numbers(sequence).each do |space|
    @game.place_mark space
  end
end

Then /^"([^"]*)" should "([^"]*)"$/ do |player, outcome|
  @game.winner.should     == Player.new(player) if outcome == 'win'
  @game.winner.should_not == Player.new(player) if outcome == 'lose'
end

Then /^the game should be a draw$/ do
  @game.winner.should == Player.draw
end

Then /^I should see the new positions:$/ do |table|
  positions_list = players_to_board(@game.positions)
  positions_grid = list_to_grid(positions_list, @game.length)
  table.raw.should == positions_grid
end

Then /^"([^\"]+)" should be the current player$/ do |player|
  @game.player.should == Player.new(player)
end

Then /^the last placed mark should not be valid$/ do
  @game.should_not be_valid_move
end
