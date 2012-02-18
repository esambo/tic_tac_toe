require 'spec_helper'
require 'tic_tac_toe/data/win_position'

module TicTacToe
  describe WinPosition do
    describe '#new' do
      it 'should have #position_number, #ply_number, #rank and #winner' do
        position_number =  1
        ply_number      =  0
        rank            =  0
        winner          = 'X'
        win_position = WinPosition.new
        win_position.position_number = position_number
        win_position.ply_number      = ply_number
        win_position.rank            = rank
        win_position.winner          = winner
        win_position.should == WinPosition.new(
          position_number,
          ply_number,
          rank,
          winner
        )
      end
    end
  end
end
