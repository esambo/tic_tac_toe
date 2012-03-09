module PutString
  def puts(str)
    self << str
  end
end

def output
  @output ||= [].extend PutString
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
  grid_border     = '+---+---+---+'
  occurances      = 2
  found_all       = false
  @output_index ||= 0
  occurances.times do |o|
    i = output[@output_index..-1].index(grid_border)
    unless i.nil?
      @output_index += i + 1
      found_all = (occurances == o + 1)
    end
  end
  unless found_all
    failure_message    = "Expected: #{output}\nto include: #{grid_border}\n#{occurances} times."
    failure_message   += "\nGot:\n"
    output[@output_index..-1].each do |e|
      failure_message += "#{e.inspect}\n"
    end
    fail failure_message
  end
end

Then /^I should see the position number of player "([^\"]+)"$/ do |mark|
  output.should include("#{mark} player ply position number: 6")
end
