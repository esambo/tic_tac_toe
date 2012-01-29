require 'spec_helper'

def draw_sequence
  '1 2 B
   C A 4
   3 D 5'.split
end

describe Game do
  let(:game) { Game.new }

  it 'should have a default player X' do
    game.player.should be_x
  end

  it 'should have the #player take turns' do
    game.player.should_receive(:turn)
    game.place_mark 1
  end

  describe '#positions' do
    context 'with no marks' do
      it 'should have 9 empty player spaces' do
        game.positions.should == Array.new(9, Player.none)
      end
    end

    context 'with all marks' do
      it 'should have each mark in the correct space' do
        sequence = '
          1 2 B
          C A 4
          3 D 5'.split
        GridMarkConverter.new.to_sequential_numbers(sequence).each do |space|
          game.place_mark space
        end
        game.positions.should == '
          X X O
          O O X
          X O X
        '.split.map do |player|
          Player.new player
        end
      end
    end
  end

  describe '#draw?' do

    context 'with too few marked spaces' do
      it 'should be false' do
        1.upto(4) do |space|
          game.place_mark space
        end
        game.should_not be_draw
      end
    end

    context 'with no three in a row' do
      it 'should be false' do
        sequence = '
          1 2 B
          C A _
          3 _ _
        '.split
        sequence.each do |space|
          game.place_mark space
        end
        # pending '==> implement rest first'
        game.should_not be_draw
      end
    end

    context 'with all marks' do
      it 'should be true' do
        draw_sequence.each do |space|
          game.place_mark space
        end
        pending '==> implement rest first'
        game.should be_draw
      end
    end
  end

  context 'internal' do
    describe '#marks' do
      context 'with no marks' do
        it 'should be 0' do
          game.marks.should == 0
        end
      end

      context 'with all marks' do
        before :each do
          1.upto(9) do |space|
            game.place_mark space
          end
        end

        it 'should be 9' do
          game.marks.should == 9
        end
      end
    end

  end
end
