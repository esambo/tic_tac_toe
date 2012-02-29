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

    describe '#place_mark_at_index' do
      context 'with index 0' do
        let(:index) { 0 }
        it 'should place a mark in the first position' do
          board_state.place_mark_at_index(index)
          board_state.positions[index].should_not be_none
        end
      end
    end

    describe '#last_position_number' do

      context 'with empty board' do
        it 'should be 0 (invalid, non-positive number)' do
          board_state.last_position_number.should == 0
        end
      end

      context 'with one mark at index 0' do
        before :each do
          board_state.place_mark_at_index(0)
        end
        it 'should be 1' do
          board_state.last_position_number.should == 1
        end
      end

    end

  end
end
