require 'spec_helper'
require 'tic_tac_toe/controllers/game_controller'
require 'tic_tac_toe/views/game_start_view'

module TicTacToe
  module UI
    describe GameController do
      let(:input)  { double :input }
      let(:output) { double(:output).as_null_object }
      let(:game)   { GameController.new input, output }

      describe '#ply_controller' do
        context 'after #start' do
          let(:ply_controller) { double :ply, :ai_vs_human => nil }
          let(:ply_controller_source) { ->(input, output, length, board_state){ ply_controller } }
          it 'should return it' do
            game.stub :render_welcome_message
            game.ply_controller_source =  ply_controller_source
            game.start
            game.ply_controller.should == ply_controller
          end
        end
      end

      describe '#start' do

        it 'should call GameStartView.new#render' do
          game.stub(:new_board_state)
          game.stub_chain(:new_ply_controller, :ai_vs_human)
          view = double('game_start_view', :new => nil)
          view.should_receive(:render)
          game.game_start_view_source = ->(output, message){ view }
          game.start
        end

        it 'should call new BoardState' do
          ply_controller = double :ply, :ai_vs_human => nil
          game.ply_controller_source = ->(input, output, length, board_state){ ply_controller }
          factory = double('BoardStateFactory.new')
          factory.should_receive(:call)
          game.board_state_factory = factory
          game.start
        end

        it 'should call PlyController#ai_vs_human' do
          game.stub(:new_board_state)
          ply = double('new_ply_controller')
          ply.should_receive(:ai_vs_human)
          game.ply_controller_source = ->(input, output, length, board_state){ ply }
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
