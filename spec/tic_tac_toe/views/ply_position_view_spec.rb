require 'spec_helper'
require 'tic_tac_toe/views/ply_position_view'

module TicTacToe
  module UI
    describe PlyPositionView do
      let(:output) { double('output').as_null_object }

      describe '#render' do
        context 'with place_mark and number' do
          let(:player_mark) { 'X' }
          let(:number)      {  1  }
          let(:view)  { PlyPositionView.new output, player_mark, number }

          it 'should output the player and its position number' do
            output.should_receive(:puts).with("X player ply position number: 1")
            view.render
          end

        end
      end

    end
  end
end
