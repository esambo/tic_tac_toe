require 'spec_helper'
require 'tic_tac_toe/view_model/game_start_view_model'

module TicTacToe
  module UI
    describe GameStartViewModel do
      let(:view_model) { GameStartViewModel.new }

      describe '#new' do
        it 'should have #welcome_message' do
          welcome_message = 'Tic-Tac-Toe'
          view_model.welcome_message = welcome_message
          view_model.should == GameStartViewModel.new(
            welcome_message
          )
        end
      end

    end
  end
end
