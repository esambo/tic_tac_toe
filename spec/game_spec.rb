require 'spec_helper'

describe Game do
  let(:game) { Game.new }

  it 'should have a default player X' do
    game.player.should be_x
  end

  it 'should have the #player take turns' do
    game.player.should_receive(:turn)
    game.place_mark 1
  end
end
