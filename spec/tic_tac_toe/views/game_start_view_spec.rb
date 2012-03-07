require 'spec_helper'
require 'tic_tac_toe/views/game_start_view'

module TicTacToe
  module UI
    describe GameStartView do
      let(:output) { double('output').as_null_object }

      describe '#render' do
        context 'with message' do
          let(:message) { 'Tic-Tac-Toe' }
          let(:view)    { GameStartView.new output, message }
          it 'should output message' do
            output.should_receive(:puts).with(message)
            view.render
          end
        end
      end

    end
  end
end
