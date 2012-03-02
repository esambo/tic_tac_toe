require 'spec_helper'
require 'tic_tac_toe/controllers/game_controller'
require 'tic_tac_toe/view_models/game_start_view_model'
require 'tic_tac_toe/views/game_start_view'

module TicTacToe
  module UI
    describe GameController do
      let(:output) { double('output').as_null_object }
      let(:game)   { GameController.new output }

      describe '#start' do
        context 'with new game' do
          it 'should send welcome message' do
            output.should_receive(:puts).with('Tic-Tac-Toe')
            game.start
          end
        end
      end

    end
  end
end
