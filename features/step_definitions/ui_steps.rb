module PutString
  def puts(str)
    self << str
  end
end

module GetChar
  def getc
    self.shift
  end
end

def output
  @output ||= [].extend PutString
end

def append_to_input(inputs)
  @input = input + inputs
  @input.extend(GetChar)
end

def input
  @input ||= [].extend GetChar
end

def validate_incrementally(find_in, find, index)
  index ||= 0
  find_in[index..-1].should include(find)
  i = find_in[index..-1].index(find)
  index += i + 1 unless i.nil?
  index
end


When /^I start a game$/ do
  game = TicTacToe::UI::GameController.new input, output
  length   = 3
  sequence = '124753'.chars
  factory  = TicTacToe::BoardStateSequenceFactory.new length, sequence
  game.board_state_factory = factory
  game.start
  @ply = game.ply_controller
end

When /^I mark an open position$/ do
  @open_position_number = @ply.board_state.positions.index(TicTacToe::Player.none) + 1
  @ply.input = append_to_input [@open_position_number]
  @ply.human_ply
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

Then /^I should see the position number of player "([^\"]+)" next$/ do |mark|
  text = "#{mark} player ply position number: 6"
  @output_index = validate_incrementally(output, text, @output_index)
end

Then /^I should see that the next ply is for player "([^\"]+)" next$/ do |mark|
  text = "#{mark} player ply position number: "
  @output_index = validate_incrementally(output, text, @output_index)
end

Then /^it should get marked$/ do
  @ply.board_state.positions[@open_position_number - 1].should_not == TicTacToe::Player.none
  input.getc.should == nil
end
