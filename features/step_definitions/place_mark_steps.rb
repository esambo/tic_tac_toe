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

Given /^one empty space$/ do
  @game = Game.new
  sequence = '
    1 2 B
    C A 4
    3 D _'.split
  GridMarkConverter.new.to_sequential_numbers(sequence).each do |space|
    @game.place_mark space
  end
end

Then /^the game should be a draw$/ do
  @game.winner.should == Player.none
end
