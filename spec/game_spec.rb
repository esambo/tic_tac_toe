require 'spec_helper'

describe Game do
  it 'should have a default player X' do
    Game.new.player.should be_x
  end
end
