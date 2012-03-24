require 'spec_helper'
require 'tic_tac_toe/views/ply_player_view'

module TicTacToe
  module UI
    describe PlyPlayerView do
      let(:output) { double('output').as_null_object }

      describe '#render' do
        context 'with player_mark' do
          let(:player_mark) { 'X' }
          let(:view) { PlyPlayerView.new output, player_mark }
          it 'should output the player' do
            output.should_receive(:print).with("X player position number: ")
            view.render
          end
        end
      end

    end
  end
end
