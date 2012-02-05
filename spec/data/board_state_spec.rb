require 'spec_helper'
require 'data/player'
require 'data/board_state'

describe BoardState do

  describe '#new' do
    context "with length 3, empty space and first player 'X'" do
      let(:length)       { 3 }
      let(:emtpy_space)  { Player.none }
      let(:first_player) { Player.X }
      let(:board_state)  { BoardState.new length, emtpy_space, first_player }

      it "should have a default player 'X'" do
        board_state.player.should be_X
      end

      it 'should have size 9' do
        board_state.size.should == 9
      end

      it 'should have 9 empty positions' do
        board_state.positions.count(Player.none).should == 9
      end
    end
  end
end
