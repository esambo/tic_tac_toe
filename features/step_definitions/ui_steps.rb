module PutString
  def puts(str)
    self << str
  end
end

def output
  @output ||= [].extend PutString
end


When /^I start the game \(with some pre\-fills\)$/ do
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

Then /^I should see the grid$/ do
  output.should include('+---+---+---+')
end

Then /^I should see the position number of player "([^\"]+)"$/ do |mark|
  output.should include("#{mark} player ply position number: 6")
end
