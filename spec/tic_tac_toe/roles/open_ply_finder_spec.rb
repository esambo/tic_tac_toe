require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/roles/open_ply_finder'

module TicTacToe
  describe OpenPlyFinder do

    let(:board_state) { BoardState.new 3, Player.none, Player.X }
    before :each do
      board_state.extend OpenPlyFinder
    end

    describe '#successors', :include_helpers do
      context 'with last spot empty' do
        it "should return one full board_states with 'X' in the last spot" do
          sequence = '
            1 2 A
            B 3 4
            D C _'.split
          setup_board_state(sequence)
          board_states = board_state.successors
          board_states.count.should == 1
          board_states.first.positions.map(&:to_s).should == '
            X X O
            O X X
            O O X
          '.split
        end
      end

      context 'with last three spots empty' do
        it "should return 3 full board_states with 'X' in one at a time" do
          sequence = '
            1 2 A
            B C 3
            _ _ _'.split
          setup_board_state(sequence)
          board_states = board_state.successors
          board_states.count.should == 3
          board_states[0].positions.map(&:to_s).should == [
            'X', 'X', 'O',
            'O', 'O', 'X',
            'X', ' ', ' ']
          board_states[1].positions.map(&:to_s).should == [
            'X', 'X', 'O',
            'O', 'O', 'X',
            ' ', 'X', ' ']
          board_states[2].positions.map(&:to_s).should == [
            'X', 'X', 'O',
            'O', 'O', 'X',
            ' ', ' ', 'X']
        end

        it 'should have switched the players' do
          board_state.next_player.should == Player.X
          board_states = board_state.successors
          3.times do |i|
            board_states[i].next_player.should == Player.O
          end
        end
      end
    end

    describe '#deep_copy' do
      it 'should return a new board state' do
        board_state.object_id.should_not == board_state.deep_copy.object_id
      end

      it 'should have new #object_id values for the positions' do
        board_state.positions.object_id.should_not == board_state.deep_copy.positions.object_id
      end

      it 'should still have the extended methods' do
        board_state.deep_copy.respond_to?(:successors).should == true
      end
    end

    describe '#place_mark_at_index' do
      context 'with placing a mark in the first space' do
        let(:number) { 1 }

        it 'should place a mark' do
          index = number - 1
          board_state.positions[index].should == Player.none
          board_state.place_mark_at_index index
          board_state.positions[index].should == Player.X
        end

        it 'should remember the last placed position number' do
          index = number - 1
          board_state.place_mark_at_index index
          board_state.last_position_number.should == number
        end
      end
    end
  end
end
