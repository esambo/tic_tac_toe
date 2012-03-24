require 'spec_helper'
require 'tic_tac_toe/views/ply_position_view'

module TicTacToe
  module UI
    describe PlyPositionView do
      let(:output) { double('output').as_null_object }

      describe '#render' do
        context 'with number' do
          let(:view) { PlyPositionView.new output, number }
          let(:number) { 1 }
          it 'should output the position number' do
            output.should_receive(:puts).with('1')
            view.render
          end
        end
      end

    end
  end
end
