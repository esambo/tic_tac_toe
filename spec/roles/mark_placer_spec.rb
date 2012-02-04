require 'spec_helper'

def board_of_marks_to_sequental_players(grid_of_string_marks)
  grid_of_string_marks.split.map { |mark| Player.new mark }
end

def setup_board_state(sequence)
  BoardMarkConverter.new.to_alternating_sequence_numbers(sequence).each do |mark|
    board_state.place_mark mark
  end
end

describe MarkPlacer do
  let(:board_state) { BoardState.new }

  describe '#place_mark' do
    context 'with no marks' do
      it 'should have 9 empty player spaces' do
        board_state.positions.should == Array.new(9, Player.none)
      end
    end

    context 'with all marks' do
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

    it 'should have the #player take turns' do
      board_state.player.should_receive(:turn)
      board_state.place_mark 1
    end
  end

  describe '#valid_ply?' do
    context 'with free space' do
      it 'should be true' do
        board_state.place_mark 1
        board_state.should be_valid_ply
      end
    end

    context 'with place mark on already taken space' do
      it 'shuold be false' do
        board_state.place_mark 1
        board_state.place_mark 1
        board_state.should_not be_valid_ply
      end
    end
  end
end
