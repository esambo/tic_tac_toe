require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/roles/winner'

module TicTacToe
  describe Winner do

    let(:board_state) { BoardState.new 3, Player.none, Player.X }
    before :each do
      board_state.extend Winner
    end

    describe '#winner', :include_helpers do
      context "with 'X' winning" do
        def win_X_grid
          ' 1 A B
            2 _ _
            3 _ _'.split
        end
        before :each do
          setup_board_state(win_X_grid)
        end

        it "should return 'X'" do
          board_state.winner.should == Player.X
        end

        it "should not be return 'O'" do
          board_state.winner.should_not == Player.O
        end

        it 'should not be a draw' do
          board_state.winner.should_not == Player.draw
        end

        it 'should be terminal' do
          board_state.should be_terminal
        end
      end

      context "with 'O' winning" do
        def win_O_grid
          ' A B C
            2 1 _
            3 _ _'.split
        end
        before :each do
          setup_board_state(win_O_grid)
        end

        it "should return 'O'" do
          board_state.winner.should == Player.O
        end

        it 'should be terminal' do
          board_state.should be_terminal
        end
      end

      context 'with a draw' do
        def draw_grid
          ' 1 2 B
            C A 4
            3 D 5'.split
        end
        before :each do
          setup_board_state(draw_grid)
        end

        it 'should be a draw' do
          board_state.should be_full
          board_state.winner.should == Player.draw
        end

        it 'should be terminal' do
          board_state.should be_terminal
        end
      end

      context 'with eventual draw' do
        def eventual_draw_grid
          ' 1 2 B
            C A 4
            3 _ _'.split
        end
        before :each do
          setup_board_state(eventual_draw_grid)
        end

        it 'should not yet be a draw and return nil' do
          board_state.should_not be_full
          board_state.winner.should be_nil
        end

        it 'should not be terminal' do
          board_state.should_not be_terminal
        end
      end

      context 'with empty grid' do
        def empty_grid
          ' _ _ _
            _ _ _
            _ _ _'.split
        end
        before :each do
          setup_board_state(empty_grid)
        end

        it 'should return nil' do
          board_state.should_not be_full
          board_state.winner.should be_nil
        end

        it 'should be terminal' do
          board_state.should_not be_terminal
        end
      end
    end

    context 'internal ' do
      describe '#win_positions' do
        context 'with zero based index' do
          def string_element_array_to_i(array_of_elements_in_string)
            array_of_elements_in_string.map { |elements_in_string|
              elements_in_string.split.map(&:to_i)
            }
          end

          it 'should have 3 rows, 3 cols and 2 diagonals' do
            board_state.send(:win_positions).should ==
              string_element_array_to_i([
                '0 1 2',
                '3 4 5',
                '6 7 8',

                '0
                 3
                 6    ',
                '  1
                   4
                   7  ',
                '    2
                     5
                     8',

                '0
                   4
                     8',
                '    2
                   4
                 6    ',
            ])
          end
        end
      end

      describe '#marks_to_win_positions', :include_helpers do
        context 'with win' do
          def string_element_array_to_player(array_of_elements_in_string)
            array_of_elements_in_string.map { |elements_in_string|
              board_of_marks_to_sequental_players(elements_in_string)
            }
          end

          it 'should handle empty marks' do
            sequence = '
              1 A B
              2 _ _
              3 _ _'.split
            setup_board_state(sequence)
            board_state.send(:marks_to_win_positions).should ==
              string_element_array_to_player([
                'X O O',
                'X _ _',
                'X _ _',

                'X
                 X
                 X    ',
                '  O
                   _
                   _  ',
                '    O
                     _
                     _',

                'X
                   _
                     _',
                '    O
                   _
                 X    ',
              ])
          end
        end
      end
    end
  end
end
