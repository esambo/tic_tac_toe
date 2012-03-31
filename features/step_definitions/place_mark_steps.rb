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

Given /^the grid sequence:$/ do |data_table|
  @board_state = new_board_state
  board = data_table_to_board(data_table)
  place_board_with_alternating_marks @board_state, board
  @alternating_sequence_numbers = board_to_alternating_sequence_numbers(board)
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

When /^the AI places its best sequential positions$/ do
  @positions_placed_by_ai = []
  begin
    player_x_position_number = @alternating_sequence_numbers.shift
    @response_set = place_best_position(@board_state)
    @positions_placed_by_ai.push(
    { :expected => player_x_position_number.to_i,
      :actual   => @board_state.last_position_number
    })
    unless @alternating_sequence_numbers.empty?
      player_o_position_number = @alternating_sequence_numbers.shift
      place_mark_context @board_state, player_o_position_number
    end
  end until @alternating_sequence_numbers.empty?
end

Then /^"([^"]*)" should "([^"]*)"$/ do |mark, outcome|
  player = TicTacToe::Player.new mark
  failure_message = "expected winner: #{player.inspect}\n     got winner: #{@response_set.winner.inspect}\nin response_set: #{@response_set.inspect}\n"
  if outcome == 'win'
    @response_set.winner.should     eq(player), failure_message
  elsif outcome == 'lose'
    @response_set.winner.should_not == player
  end
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

Then /^the game should at least be a win$/ do
  @best_position.winner.should == TicTacToe::Player.X
end

Then /^the game should at least be a draw$/ do
  @best_position.winner.should_not == TicTacToe::Player.O
end

Then /^the AI should have placed its marks at the indicated positions$/ do
  @positions_placed_by_ai.each do |test|
    test[:actual].should == test[:expected]
  end
end
