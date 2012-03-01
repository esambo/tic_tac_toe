module PutString
  def puts(str)
    self << str
  end
end

def output
  @output ||= [].extend PutString
end


When /^I start the game$/ do
  game = TicTacToe::UI::GameController.new output
  game.start
end

Then /^I should see "([^\"]+)"$/ do |text|
  output.should include(text)
end
