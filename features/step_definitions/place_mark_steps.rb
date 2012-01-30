def draw_grid
  ' 1 2 B
    C A 4
    3 D 5'.split
end

def win_X_grid
  ' 1 A B
    2 _ _
    3 _ _'.split
end

def win_O_grid
  ' A B C
    2 1 _
    3 _ _'.split
end

Given /^a game$/ do
  @game = Game.new
end

Given /^I am the first player "([^\"]+)"$/ do |player|
  @game = Game.new
  @player = Player.new player
end

When /^I place a mark$/ do
  @game.place_mark 1
end

When /^I win$/ do
  sequence = @player.X? ? win_X_grid : win_O_grid
  GridMarkConverter.new.to_sequential_numbers(sequence).each do |space|
    @game.place_mark space
  end
end

When /^the board is full without a three in a row$/ do
  sequence = draw_grid
  GridMarkConverter.new.to_sequential_numbers(sequence).each do |space|
    @game.place_mark space
  end
end

Then /^"([^"]*)" should "([^"]*)"$/ do |player, outcome|
  @game.winner.should     == Player.new(player) if outcome == 'win'
  @game.winner.should_not == Player.new(player) if outcome == 'lose'
end

Then /^the game should be a draw$/ do
  @game.winner.should == Player.draw
end

Then /^I should see my new positions$/ do
  @game.positions[1].should_not == @game.player.none?
end

Then /^"([^\"]+)" should be the current player$/ do |player|
  @game.player.should == Player.new(player)
end
