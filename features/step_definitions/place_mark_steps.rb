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

Given /^the grid sequence with the indicated winning mark "([^\"]+)":$/ do |winning_mark, data_table|
  @board_state = new_board_state
  board = data_table_to_board(data_table)
  place_board_with_alternating_marks @board_state, board
  @win_number = board_to_win_number(board, winning_mark)
  board = clear_win_number(board, @win_number)
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
  @board_state.last_position_number.should == @win_number.should
end
