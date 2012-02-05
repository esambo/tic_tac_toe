require 'spec_helper'
require 'board_mark_converter'

describe BoardMarkConverter do
  let(:converter) { BoardMarkConverter.new }

  describe '#to_alternating_sequence_numbers for both X and O players (having their ply order indicated by numbers and characters respectively) assuming X goes first' do

    context 'with empty board' do
      it 'should have 0 numbers' do
        converter.to_alternating_sequence_numbers('
          _ _ _
          _ _ _
          _ _ _
        '.split).should == []
      end
    end

    context "with first mark for 'X'" do
      it 'should get the number of its position' do
        numbers = converter.to_alternating_sequence_numbers('
          _ _ 1
          _ _ _
          _ _ _ '.split)
        numbers.should == '3'.split
      end
    end

    context "with first mark for 'X' and then one for 'O'" do
      it "should get the position numbers in the correct alternating ply order starting with 'X'" do
        numbers = converter.to_alternating_sequence_numbers('
          _ _ 1
          _ _ _
          A _ _ '.split)
        numbers.should == '3 7'.split
      end
    end

    context 'with fast win board' do
      it 'should have 5 different place mark numbers' do
        numbers = converter.to_alternating_sequence_numbers('
          1 A B
          2 _ _
          3 _ _ '.split)
        numbers.should == '1 2 4 3 7'.split
        numbers.uniq.count.should == 5
      end
    end

    context 'with full board' do
      it 'should have 9 different place mark numbers' do
        numbers = converter.to_alternating_sequence_numbers('
          1 2 B
          C A 4
          3 D 5 '.split)
        numbers.should == '1 5 2 3 7 4 6 8 9'.split
        numbers.uniq.count.should == 9
      end
    end
  end
end

