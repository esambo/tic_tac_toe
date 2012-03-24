require 'spec_helper'
require 'tic_tac_toe/views/ply_position_view'

module TicTacToe
  module UI
    describe PlyPositionView do
      let(:output) { double('output').as_null_object }

      describe '#render' do
        context 'with place_mark' do
          let(:player_mark) { 'X' }
          let(:view)  { PlyPositionView.new output, player_mark, number }

          context 'with number' do
            let(:number) { 1 }
            it 'should output the player and its position number' do
              output.should_receive(:print).with("X player position number: 1")
              output.should_receive(:print).with("\n")
              view.render
            end
          end

          context 'without number' do
            let(:number) { nil }
            it 'should output the player only' do
              output.should_receive(:print).with("X player position number: ")
              output.should_not_receive(:print).with("\n")
              view.render
            end
          end

        end
      end

    end
  end
end
