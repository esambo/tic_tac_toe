require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/data/board_state_factory'

module TicTacToe
  describe BoardStateFactory do

    describe '#new' do
      context 'with length 3' do
        let(:length) { 3 }
        let(:factory) { BoardStateFactory.new length }

        context 'creates a new empty board state where ' do
          let(:board_state) { factory.call }

          it '#length should be 3' do
            board_state.length.should == length
          end

          it "#next_player should be 'X'" do
            board_state.next_player.should == Player.X
          end

          it '#positions should all be empty' do
            board_state.positions.count(Player.none) == 9
          end

          it '#last_position_number should be 0' do
            board_state.last_position_number.should == 0
          end

        end

      end
    end

  end
end
