module PutString
  def puts(str)
    self << str
  end

  def print(str)
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

def new_game
  TicTacToe::UI::GameController.new input, output
end

def new_board_state_factory(sequence)
  length  = 3
  TicTacToe::BoardStateSequenceFactory.new length, sequence
end

When /^I start a game$/ do
  sequence = '124753'.chars
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

Then /^I should see the position number of player "([^\"]+)" next$/ do |mark|
  text = "#{mark} player position number: 6"
  @output_index = validate_incrementally(output, text, @output_index)
end

Then /^I should see that the next ply is for player "([^\"]+)" next$/ do |mark|
  text = "#{mark} player position number: "
  @output_index = validate_incrementally(output, text, @output_index)
end
