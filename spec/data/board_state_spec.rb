require 'spec_helper'
require 'data/player'
require 'data/board_state'

describe BoardState do
  let(:board_state) { BoardState.new }

  describe '#new' do
    it 'should have a default player X' do
      board_state.player.should be_X
    end
  end
end
