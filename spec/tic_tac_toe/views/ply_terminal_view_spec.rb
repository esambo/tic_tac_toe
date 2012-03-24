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
          let(:view)   { PlyTerminalView.new output, player }

          it 'should output game over' do
            output.should_receive(:print).with('Game over. ')
            view.render
          end

          it 'should output the winning player' do
            output.should_receive(:puts).with('Player X won!')
            view.render
          end

        end

        context 'with player :draw' do
          let(:player) { Player.draw }
          let(:view)   { PlyTerminalView.new output, player }
          it 'should output draw' do
            output.should_receive(:puts).with('It was a draw!')
            view.render
          end
        end

      end

    end
  end
end
