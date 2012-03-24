require 'spec_helper'
require 'tic_tac_toe/views/ply_invalid_position_view'

module TicTacToe
  module UI
    describe PlyInvalidPositionView do
      let(:output) { double('output').as_null_object }

      describe '#render' do
        context 'with place_mark' do
          let(:view)  { PlyInvalidPositionView.new output }
          it 'should output an error message' do
            output.should_receive(:puts).with('Invalid position number! Please try again...')
            view.render
          end
        end
      end

    end
  end
end
