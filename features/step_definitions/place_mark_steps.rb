Given /^it is my turn$/ do
  @game = Game.new
end

When /^I place a mark$/ do
  @game.place_mark 1
end

Then /^I should see my new positions$/ do
  @game.positions[1].should_not == @game.player.none?
end

Given /^a new game$/ do
  @game = Game.new
end

When /^"([^\"]+)" marks a space$/ do |player|
  @game.place_mark 1
end

Then /^"([^\"]+)" should be the current player$/ do |player|
  @game.player.should be_o
end

Given /^one empyt space$/ do
  @game = Game.new
  1.upto(8) do |space|
    @game.place_mark space
  end
end

Then /^the game should be a "([^\"]*)"$/ do |outcome|
  pending
  @game.should be_draw
end
