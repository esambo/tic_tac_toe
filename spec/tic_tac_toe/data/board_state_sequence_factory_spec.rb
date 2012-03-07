require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/response_set'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/data/board_state_factory'
require 'tic_tac_toe/data/board_state_sequence_factory'
require 'tic_tac_toe/contexts/place_mark_context'

module TicTacToe
  describe BoardStateSequenceFactory do

    describe '#new' do
      context 'with length 3 and sequence' do
        let(:length)   { 3 }
        let(:sequence) { '1247536'.chars }
        let(:factory) { BoardStateSequenceFactory.new length, sequence }

        context 'creates a new pre filled board state where ' do
          let(:board_state) { factory.call }

          it '#length should be 3' do
            board_state.length.should == length
          end

          it "#next_player should be 'O'" do
            board_state.next_player.should == Player.O
          end

          it '#positions should have two empty spaces' do
            board_state.positions.count(Player.none) == 2
          end

          it '#last_position_number should be the last sequence number' do
            board_state.last_position_number.should == sequence.to_a.last.to_i
          end

        end

      end
    end

  end
end
