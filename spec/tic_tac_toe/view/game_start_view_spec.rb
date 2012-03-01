require 'spec_helper'
require 'tic_tac_toe/view/game_start_view'

module TicTacToe
  module UI
    describe GameStartView do
      let(:output)     { double('output').as_null_object }
      let(:view_model) { double(:ViewModel) }
      let(:view)       { GameStartView.new output, view_model }

      describe '#render' do
        context 'with welcome_message in view model' do
          before :each do
            view_model.stub(:welcome_message) { 'Tic-Tac-Toe' }
          end
          it 'should output welcome_message' do
            output.should_receive(:puts).with('Tic-Tac-Toe')
            view.render
          end
        end
      end

    end
  end
end
