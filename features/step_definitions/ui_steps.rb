module PutString
  def puts(str)
    self << str
  end
end

def output
  @output ||= [].extend PutString
end


def validate_incrementally(find_in, find, index)
  index ||= 0
  find_in[index..-1].should include(find)
  i = find_in[index..-1].index(find)
  index += i + 1 unless i.nil?
  index
end


When /^I start a game$/ do
  game = TicTacToe::UI::GameController.new output
  length   = 3
  sequence = '124753'.chars
  factory  = TicTacToe::BoardStateSequenceFactory.new length, sequence
  game.board_state_factory = factory
  game.start
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
