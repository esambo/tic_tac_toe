require 'spec_helper'
require 'tic_tac_toe/data/player'
require 'tic_tac_toe/data/board_state'
require 'tic_tac_toe/roles/take_turns'

module TicTacToe
  describe TakeTurns do
    let(:board_state) { BoardState.new 0, nil, nil }
    before :each do
      board_state.extend TakeTurns
    end

    describe '#take_turn' do
      context "with 'X'" do
        before :each do
          board_state.next_player = Player.X
        end
        it "should be 'O'" do
          board_state.take_turn
          board_state.next_player.should == Player.O
        end
      end
    end

  end
end
