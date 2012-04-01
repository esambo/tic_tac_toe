require 'spec_helper'
require 'tic_tac_toe/presenters/board_presenter'

module TicTacToe
  module UI
    describe BoardPresenter do
      context "with positions ['X', 'X', 'X', 'O', 'O', 'O', ' ', ' ', ' ']" do
        let(:length)    { 3 }
        let(:positions) {     ['X', 'X', 'X', 'O', 'O', 'O', ' ', ' ', ' '] }
        let(:presenter) { BoardPresenter.new positions, length }

        describe '#as_matrix' do
          it 'should convert array to matrix' do
            presenter.as_matrix.should == [
              ['X', 'X', 'X'],
              ['O', 'O', 'O'],
              [' ', ' ', ' '],
            ]
          end
        end

        describe '#call' do
          it 'should return table with grid lines' do
            presenter.call.should ==
              "+---+---+---+\n" +
              "| X | X | X |\n" +
              "| O | O | O |\n" +
              "|   |   |   |\n" +
              "+---+---+---+"
          end
        end

      end
    end
  end
end
