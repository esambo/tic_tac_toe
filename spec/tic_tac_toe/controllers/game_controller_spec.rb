require 'spec_helper'
require 'tic_tac_toe/controllers/game_controller'
require 'tic_tac_toe/views/game_start_view'

module TicTacToe
  module UI
    describe GameController do
      let(:output) { double('output').as_null_object }
      let(:game)   { GameController.new output }

      describe '#start' do

        it 'should render welcome message' do
          game.stub(:new_board_state)
          game.stub_chain(:new_ply_controller, :ai_vs_human)
          output.should_receive(:puts).with('Tic-Tac-Toe')
          game.start
        end

        it 'should call new BoardState' do
          game.stub_chain(:new_ply_controller, :ai_vs_human)
          factory = double('BoardStateFactory.new')
          factory.should_receive(:call)
          game.board_state_factory = factory
          game.start
        end

        it 'should call PlyController#ai_vs_human' do
          game.stub(:new_board_state)
          ply = double('new_ply_controller')
          ply.should_receive(:ai_vs_human)
          game.ply_controller_source = ->(output, length){ ply }
          game.start
        end

      end

      describe 'internal ' do

        describe '#new_board_state' do
          it 'should get a new BoardState' do
            board_state = double('board_state')
            factory = double('BoardStateFactory.new', :call => board_state)
            game.board_state_factory = factory
            game.send(:new_board_state).should == board_state
          end
        end

      end

    end
  end
end
