Given /^it is my turn$/ do
  @game = Game.new
end

When /^I place a mark$/ do
  @game.place_mark 1
end

Then /^I should see my new possitions$/ do
  @game.possitions[1].should_not == @game.player.none?
end
