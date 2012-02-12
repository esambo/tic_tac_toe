require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/data/win_position'
require 'tic_tac_toe/roles/winner'
require 'tic_tac_toe/roles/open_ply_finder'
require 'tic_tac_toe/roles/minimax'
require 'tic_tac_toe/board_mark_converter'

module TicTacToe
  describe Minimax do

    def board_of_marks_to_sequental_players(grid_of_string_marks)
      grid_of_string_marks.split.map { |mark| Player.new mark }
    end

    def setup_board_state(sequence)
      setup_players(
        BoardMarkConverter.new.to_alternating_sequence_numbers(sequence)
      )
    end

      def setup_players(alternating_sequence_numbers)
        player = Player.X
        alternating_sequence_numbers.each do |number|
          board_state.place_mark_at_index number.to_i - 1
        end
      end

    let(:board_state) { BoardState.new 3, Player.none, Player.X }
    before :each do
      board_state.extend Winner
      board_state.extend OpenPlyFinder
      board_state.extend Minimax
    end

    describe '#best_position' do

      context "with 'X' in winning position" do
        it 'should find that position number' do
          sequence = '
            1 2 3
            A B _
            _ _ _'.split
          setup_board_state(sequence)
          board_state.last_position_number.should == 3
          best_position = board_state.best_position
          best_position.position_number.should == 3
          best_position.winner.should == Player.X
        end
      end

      context "with 'X' winning in next move" do
        it 'should find that position number' do
          sequence = '
            1 A C
            2 3 _
            B _ _'.split
          setup_board_state(sequence)
          best_position = board_state.best_position
          best_position.position_number.should == 6
          best_position.winner.should == Player.X
        end
      end
    end

    describe 'internal' do
      let(:player_X_position)    { WinPosition.new.tap do |p|
          p.position_number = 1
          p.winner          = Player.X
      end }
      let(:player_O_position)    { WinPosition.new.tap do |p|
          p.position_number = 2
          p.winner          = Player.O
      end }
      let(:player_draw_position) { WinPosition.new.tap do |p|
          p.position_number = 3
          p.winner          = Player.draw
      end }

      describe '#max_for_X' do
        context "with 'O'" do
          let(:final_positions) { [player_O_position] }
          it "should be 'O'" do
            board_state.send(:max_for_X, final_positions).should == player_O_position
          end
        end

        context "with draw and 'O'" do
          let(:final_positions) { [player_O_position, player_draw_position] }
          it "should be draw" do
            board_state.send(:max_for_X, final_positions).should == player_draw_position
          end
        end

        context "with draw, 'O' and 'X'" do
          let(:final_positions) { [player_O_position, player_draw_position, player_X_position] }
          it "should return 'X'" do
            board_state.send(:max_for_X, final_positions).should == player_X_position
          end
        end
      end

      describe '#min_for_O' do
        context "with draw, 'X' and 'O'" do
          let(:final_positions) { [player_O_position, player_draw_position, player_X_position] }
          it "should return 'O'" do
            board_state.send(:min_for_O, final_positions).should == player_O_position
          end
        end
      end
    end
  end
end
