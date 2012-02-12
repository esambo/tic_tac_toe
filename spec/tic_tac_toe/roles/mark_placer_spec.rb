require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/roles/mark_placer'

module TicTacToe
  describe MarkPlacer do

    let(:board_state) { BoardState.new 3, Player.none, Player.X }
    before :each do
      board_state.extend MarkPlacer
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

      it 'should have the #next_player take turns' do
        board_state.next_player.should_receive(:turn)
        board_state.place_mark 1
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
      end
    end
  end
end
