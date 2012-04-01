require 'spec_helper'
require 'tic_tac_toe/views/game_start_view'

module TicTacToe
  module UI
    describe GameStartView do
      let(:output) { double('output').as_null_object }

      describe '#render' do
        context 'with different kinds of messages' do
          let(:static)  { 'Tic-Tac-Toe' }
          let(:dynamic) { '1 | 2 | 3' }
          let(:view)    { GameStartView.new output, dynamic }
          it 'should output all messages' do
            output.should_receive(:puts).with(static)
            output.should_receive(:puts).with(dynamic)
            view.render
          end
        end
      end

    end
  end
end
