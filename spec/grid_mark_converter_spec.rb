require 'spec_helper'

describe GridMarkConverter do
  let(:converter) { GridMarkConverter.new }

  describe '#to_sequential_numbers generates alternating numbers for both X and O players assuming X goes first' do
    
    context 'with empty grid' do
      it 'should have 0 numbers' do
        converter.to_sequential_numbers('
          _ _ _
          _ _ _
          _ _ _
        '.split).should == []
      end
    end

    context 'with fast win grid' do
      it 'should have 5 different place mark numbers' do
        numbers = converter.to_sequential_numbers('
          1 A B
          2 _ _
          3 _ _ '.split)
        numbers.should == '1 2 4 3 7'.split
        numbers.uniq.count.should == 5
      end
    end

    context 'with full grid' do
      it 'should have 9 different place mark numbers' do
        numbers = converter.to_sequential_numbers('
          1 2 B
          C A 4
          3 D 5 '.split)
        numbers.should == '1 5 2 3 7 4 6 8 9'.split
        numbers.uniq.count.should == 9
      end
    end
  end

  describe '#to_sequential' do

    context 'with empty grid' do
      it 'should generate nothing' do
        converter.to_sequential('
          _ _ _
          _ _ _
          _ _ _
        '.split).should == []
      end
    end

    context 'with single mark X in different spaces' do
      it 'should be 1 for the top left' do
        converter.to_sequential('
          1 _ _
          _ _ _
          _ _ _
        '.split).should == ['1']
      end

      it 'should be 2 for the top middle' do
        converter.to_sequential('
          _ 1 _
          _ _ _
          _ _ _
        '.split).should == ['2']
      end

      it 'should be 3 for the top right' do
        converter.to_sequential('
          _ _ 1
          _ _ _
          _ _ _
        '.split).should == ['3']
      end

      it 'should be 5 for the center' do
        converter.to_sequential('
          _ _ _
          _ 1 _
          _ _ _
        '.split).should == ['5']
      end

      it 'should be 9 for the bottom right' do
        converter.to_sequential('
          _ _ _
          _ _ _
          _ _ 1
        '.split).should == ['9']
      end
    end

    context 'with fast win grid' do
      it 'should generate numbers for X and letters for O player' do
        converter.to_sequential('
          1 A B
          2 _ _
          3 _ _
        '.split).should == '
          1 B 4 C 7
        '.split
      end
    end

    context 'with full grid' do
      it 'should generate numbers for X and letters for O player' do
        converter.to_sequential('
          1 2 B
          C A 4
          3 D 5
        '.split
        ).should == '
          1 E 2 C 7 D 6 H 9
        '.split
      end
    end
  end
end