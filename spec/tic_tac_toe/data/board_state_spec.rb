require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'

module TicTacToe
  describe BoardState do
    let(:length)       { 3 }
    let(:emtpy_space)  { Player.none }
    let(:first_player) { Player.X }
    let(:board_state)  { BoardState.new length, emtpy_space, first_player }

    describe '#next_player' do
      context "with empty board and first player 'X'" do
        it "should be 'X'" do
          board_state.next_player.should be_X
        end
      end
    end

    describe '#positions' do
      context 'with empty board' do
        it 'should have 9 empty ones' do
          board_state.positions.count(Player.none).should == 9
        end
      end
    end

    describe '#size' do
      context 'with length 3' do
        it 'should be 9' do
          board_state.size.should == 9
        end
      end
    end

  end
end
