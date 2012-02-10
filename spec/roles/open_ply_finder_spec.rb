require 'spec_helper'
require 'data/player'
require 'data/board_state'
require 'roles/open_ply_finder'
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


describe OpenPlyFinder do
  let(:board_state) { BoardState.new 3, Player.none, Player.X }
  before :each do
    board_state.extend OpenPlyFinder
  end

  describe '#successors' do
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

    it 'should have the #next_player take turns' do
      board_state.next_player.should_receive(:turn)
      board_state.place_mark_at_index 1
    end
  end
end