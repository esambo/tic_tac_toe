require 'spec_helper'
require 'tic_tac_toe/views/ply_board_view'

module TicTacToe
  module UI
    describe PlyBoardView do
      let(:output) { double('output').as_null_object }

      describe '#render' do
        context 'with board' do
          let(:board) {
            "+---+---+---+\n" +
            "| X | X | X |\n" +
            "| O | O | O |\n" +
            "|   |   |   |\n" +
            "+---+---+---+"
          }
          let(:view)  { PlyBoardView.new output, board }

          it 'should output boarders' do
            output.should_receive(:puts).with('+---+---+---+').exactly(:twice)
            view.render
          end

          it "should output row of ' 'es among pipes without newline character" do
            output.should_receive(:puts).with('|   |   |   |')
            view.render
          end

        end
      end

    end
  end
end
