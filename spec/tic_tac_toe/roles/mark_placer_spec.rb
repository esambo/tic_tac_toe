require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/roles/mark_placer'

module TicTacToe
  describe MarkPlacer do

    let(:board_state) { BoardState.new 3, Player.none, Player.X }
    before :each do
      board_state.extend MarkPlacer
      board_state.stub(:take_turn)
    end

    describe '#place_mark' do

      context 'with no marks' do
        it 'should have 9 empty player spaces' do
          board_state.positions.should == Array.new(9, Player.none)
        end
      end


      context 'with all marks', :include_helpers do
        it 'should have each mark in the correct space' do
          sequence = '
            1 2 B
            C A 4
            3 D 5'.split
          setup_board_state(sequence)
          board_state.positions.should == board_of_marks_to_sequental_players('
            X X O
            O O X
            X O X
          ')
        end
      end

      context 'with placing a mark in the first space' do
        let(:number) { 1 }
        it 'should remember the last placed position number' do
          board_state.place_mark number
          board_state.last_position_number.should == number
        end
      end

      describe 'returns valid_ply' do

        context 'with place mark on a free space' do
          it 'should be true' do
            valid_ply = board_state.place_mark 1
            valid_ply.should == true
          end
        end

        context 'with place mark on already taken space' do
          it 'shuold be false' do
                        board_state.place_mark 1
            valid_ply = board_state.place_mark 1
            valid_ply.should == false
          end
        end

        context 'with empty number' do
          let(:number) { '' }
          it 'shuold be false' do
            valid_ply = board_state.place_mark number
            valid_ply.should == false
          end
        end

        context 'with no number' do
          let(:number) { nil }
          it 'should be false' do
            valid_ply = board_state.place_mark number
            valid_ply.should == false
          end
        end

        context 'with number above upper limit' do
          let(:number) { 10 }
          it 'should be false' do
            valid_ply = board_state.place_mark number
            valid_ply.should == false
          end
        end

        context 'with number in upper limit' do
          let(:number) { 9 }
          it 'should be ture' do
            valid_ply = board_state.place_mark number
            valid_ply.should == true
          end
        end

      end

    end

  end
end
