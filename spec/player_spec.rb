require 'spec_helper'

describe Player do

  describe '#new' do

    context 'with :none' do
      let(:player) { Player.new :none }

      it 'should be #none?' do
        player.should be_none
      end

      it 'should be #draw?' do
        player.should be_draw
      end

      it 'should not be #X?' do
        player.should_not be_X
      end

      it 'should not be #O?' do
        player.should_not be_O
      end
    end

    context 'with :X' do
      let(:player) { Player.new :X }

      it 'should be #X?' do
        player.should be_X
      end

      it 'should not be #none?' do
        player.should_not be_none
      end
    end

    context 'with :O' do
      let(:player) { Player.new :O }

      it 'should be #O?' do
        player.should be_O
      end
    end

    context "with 'X'" do
      let(:player) { Player.new 'X' }

      it 'should be #X?' do
        player.should be_X
      end
    end

    context "with 'O'" do
      let(:player) { Player.new 'O' }

      it 'should be #O?' do
        player.should be_O
      end
    end

    context "with something other than 'X' or 'O'" do
      let(:player) { Player.new '_' }
      it 'should be :none' do
        player.should be_none
      end
    end
  end

  describe '#X' do
    it 'should return a new player X' do
      Player.X.should == Player.new(:X)
    end
  end

  describe '#O' do
    it 'should return a new player O' do
      Player.O.should == Player.new(:O)
    end
  end

  describe '#none' do
    it 'should return a new none existing player' do
      Player.none.should == Player.new(:none)
    end
  end

  describe '#draw' do
    it 'should return a new none existing player' do
      Player.draw.should == Player.new(:none)
    end
  end

  describe '#turn' do
    context 'with X' do
      let(:player) { Player.new :X }

      it 'should be O' do
        player.turn.should be_O
      end
    end

    context 'with O' do
      let(:player) { Player.new :O }

      it 'should be X' do
        player.turn.should be_X
      end
    end
  end

  describe '#to_s' do
    context 'with :X' do
      it "should be 'X'" do
        Player.X.to_s.should == 'X'
      end
    end

    context 'with :none' do
      it "should be ''" do
        Player.none.to_s.should == ''
      end
    end
  end
end
