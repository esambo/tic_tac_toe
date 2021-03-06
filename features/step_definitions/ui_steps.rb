module PutString
  def puts(str)
    self << str
  end

  def print(str)
    self << str
  end
end

module GetString
  def gets
    self.shift.to_s
  end
end

def output
  @output ||= [].extend PutString
end

def append_to_input(inputs)
  @input = input + inputs
  @input.extend(GetString)
end

def input
  @input ||= [].extend GetString
end

def validate_incrementally(find_in, find, index)
  index ||= 0
  find_in[index..-1].should include(find)
  i = find_in[index..-1].index(find)
  index += i + 1 unless i.nil?
  index
end

def new_game
  TicTacToe::UI::GameController.new input, output
end

def new_board_state_factory(sequence)
  length  = 3
  TicTacToe::BoardStateSequenceFactory.new length, sequence
end


Given /^I will mark an already taken position$/ do
  @open_position_number = 1
  append_to_input [@open_position_number]
end

Given /^I will mark an empty position$/ do
  append_to_input [3]
end

When /^I start a game$/ do
  sequence = '1247'.chars
  game = new_game
  game.board_state_factory = new_board_state_factory(sequence)
  game.start
  @ply = game.ply_controller
end

When /^I start a draw game$/ do
  sequence = '15237468'.chars
  game = new_game
  game.board_state_factory = new_board_state_factory(sequence)
  game.start
  @ply = game.ply_controller
end

Then /^I should see "([^\"]+)"$/ do |text|
  output.should include(text)
end

Then /^I should see the grid next$/ do
  grid_border = '+---+---+---+'
  2.times do
    @output_index = validate_incrementally(output, grid_border, @output_index)
  end
end

Then /^I should see the player "([^\"]+)" go next$/ do |mark|
  text = "#{mark} player position number: "
  @output_index = validate_incrementally(output, text, @output_index)
end

Then /^I should see the directions$/ do
  text = "Directions:"
  @output_index = validate_incrementally(output, text, @output_index)
end

Then /^I should see that it was invalid$/ do
  text = "Invalid position number! Please try again..."
  @output_index = validate_incrementally(output, text, @output_index)

  @ply.board_state.positions[@open_position_number - 1].should == TicTacToe::Player.X
  input.gets.should == ''
end

Then /^the game should be a draw next$/ do
  text = "It was a draw!"
  @output_index = validate_incrementally(output, text, @output_index)
end

