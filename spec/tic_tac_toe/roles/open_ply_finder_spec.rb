require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/roles/open_ply_finder'

module TicTacToe
  describe OpenPlyFinder do

    let(:board_state) { BoardState.new 3, Player.none, Player.X }
    before :each do
      board_state.extend OpenPlyFinder
      board_state.stub  :take_turn
    end

    describe '#empty_spaces', :include_helpers do

      context 'with last spot empty' do
        before :each do
          sequence = '
            1 2 A
            B 3 4
            D C _'.split
          setup_board_state(sequence)
        end
        it 'should return the last positions' do
          board_state.empty_spaces.should == [9 - 1]
        end
      end

      context 'with first three spots empty' do
        before :each do
          sequence = '
            _ _ _
            1 2 A
            B C 3'.split
          setup_board_state(sequence)
        end
        it 'should return first three positions' do
          board_state.empty_spaces.should == [0, 1, 2]
        end
      end

    end

  end
end
