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
      context "with path '986473251'" do
        before :each do
          win_position.path = '9864732510'
        end

        it "should be the second last path position: '1'" do
          win_position.next_position_number.should == 1
        end
      end
    end

    describe '#position_number' do
      context "with path '1' and position number 2" do
        before :each do
          win_position.path = '1'
        end
        let(:position_number) { 2 }

        it "should change #path to '12'" do
          win_position.position_number = position_number
          win_position.path.should == '12'
        end
      end
    end
  end
end
