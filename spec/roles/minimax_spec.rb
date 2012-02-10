require 'spec_helper'
require 'data/player'
require 'data/board_state'
require 'roles/winner'
require 'roles/open_ply_finder'
require 'roles/minimax'
require 'board_mark_converter'


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


describe Minimax do
  let(:board_state) { BoardState.new 3, Player.none, Player.X }
  before :each do
    board_state.extend Winner
    board_state.extend OpenPlyFinder
    board_state.extend Minimax
  end

  describe '#best_position_number' do

    context "with 'X' in winning position" do
      it 'should find that position number' do
        sequence = '
          1 2 3
          A B _
          _ _ _'.split
        setup_board_state(sequence)
        board_state.last_position_number.should == 3
        board_state.best_position_number.should == 3
      end
    end

    context "with 'X' winning in next move" do
      it 'should find that position number' do
        sequence = '
          1 A C
          2 3 _
          B _ _'.split
        setup_board_state(sequence)
        board_state.best_position_number.should == 6
      end
    end
  end

  describe 'internal' do
    let(:player_X_position) {
      { :position_number => 1,
        :player => Player.X.to_i
      }
    }
    let(:player_O_position) {
      { :position_number => 2,
        :player => Player.O.to_i
      }
    }
    let(:player_draw_position) {
      { :position_number => 3,
        :player => Player.draw.to_i
      }
    }

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
