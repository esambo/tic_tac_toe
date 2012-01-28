require 'spec_helper'

describe Player do
  context 'with none' do
    let(:player) { Player.new :none }

    it 'should be #none?' do
      player.should be_none
    end

    it 'should not be #x?' do
      player.should_not be_x
    end

    it 'should not be #o?' do
      player.should_not be_o
    end
  end

  context 'with X' do
    let(:player) { Player.new :x }

    it 'should be #x?' do
      player.should be_x
    end

    it 'should not be #none?' do
      player.should_not be_none
    end
  end

  context 'with O' do
    let(:player) { Player.new :o }

    it 'should be #o?' do
      player.should be_o
    end
  end

  describe 'x' do
    it 'should return a new player X' do
      Player.x.should == Player.new(:x)
    end
  end
end
