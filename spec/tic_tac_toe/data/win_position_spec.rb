require 'spec_helper'
require 'tic_tac_toe/data/win_position'

module TicTacToe
  describe WinPosition do
    let(:win_position) { WinPosition.new }

    describe '#new' do
      it 'should have #position_number, #ply_number, #rank and #winner' do
        ply_number      =  0
        rank            =  0
        winner          = 'X'
        path            = '0'
        win_position.ply_number      = ply_number
        win_position.rank            = rank
        win_position.winner          = winner
        win_position.path            = path
        win_position.should == WinPosition.new(
          ply_number,
          rank,
          winner,
          path
        )
      end
    end

    describe '#next_position_number' do
      context "with path '98647325 1'" do
        before :each do
          win_position.path = '98647325 10'
        end
        it "should be the first position in the last section: '1'" do
          win_position.next_position_number.should == 1
        end
      end
    end

  end
end
