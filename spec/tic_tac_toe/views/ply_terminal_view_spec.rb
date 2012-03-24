require 'spec_helper'
require 'tic_tac_toe/views/ply_terminal_view'
require 'tic_tac_toe/data/player'

module TicTacToe
  module UI
    describe PlyTerminalView do
      let(:output) { double('output').as_null_object }

      describe '#render' do

        context "with player 'X'" do
          let(:player) { Player.X }
          let(:view) { PlyTerminalView.new output, player }
          it 'should output the player' do
            output.should_receive(:puts).with("Game over. Player X won!")
            view.render
          end
        end

      end

    end
  end
end
