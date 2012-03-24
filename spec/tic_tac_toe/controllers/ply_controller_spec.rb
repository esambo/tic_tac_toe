require 'spec_helper'
require 'tic_tac_toe/controllers/ply_controller'
require 'tic_tac_toe/services/ai_vs_human_service'

module TicTacToe
  module UI
    describe PlyController do
      let(:length) { 3 }

      describe '#new' do
        let(:input)       { double :input }
        let(:output)      { double(:output).as_null_object }
        let(:board_state) { double :board_state }
        let(:ply)         { PlyController.new input, output, length, board_state }

        it 'should set @input' do
          ply.instance_variable_get(:@input).should == input
        end

        it 'should set @output' do
          ply.instance_variable_get(:@output).should == output
        end

        it 'should set @length' do
          ply.instance_variable_get(:@length).should == length
        end

        it 'should set #board_state' do
          ply.board_state.should == board_state
        end

      end

      describe '#ai_vs_human' do
        let(:ply)     { PlyController.new nil, nil, nil, nil }
        before :each do
          ply.stub :new_ai_vs_human_service
          ply.stub :register_callbacks
          ply.stub :start
        end

          it 'should call #new_ai_vs_human_service' do
            ply.should_receive(:new_ai_vs_human_service)
            ply.ai_vs_human
          end

          it 'should call #register_callbacks' do
            ply.should_receive(:register_callbacks)
            ply.ai_vs_human
          end

          it 'should call #start' do
            ply.should_receive(:start)
            ply.ai_vs_human
          end

      end

      describe 'integration' do

        context 'with services ' do
          let(:ply) { PlyController.new nil, nil, nil, nil }

          describe '#new_ai_vs_human_service' do
            let(:service) { double :ai_vs_human_service }
            it 'should call AiVsHumanService.new' do
              board_state = double :board_state
              ply.stub(:new_ai_vs_human_service_source) { service }
              ply.ai_vs_human_service_source = ->(board_state){ service }
              ply.send(:new_ai_vs_human_service).should == service
            end
          end

          describe '#register_callbacks' do
            let(:service) { AiVsHumanService.new double(:board_state) }

            it 'should call #get_position on AiVsHumanService#get_position' do
              ply.should_receive :get_position
              ply.instance_variable_set :@service, service
              ply.register_callbacks
              service.send :get_position
            end

            it 'should call #render_board on AiVsHumanService#render_board' do
              ply.should_receive :render_board
              ply.instance_variable_set :@service, service
              ply.register_callbacks
              service.send :render_board, double(:positions)
            end

            it 'should call #render_player on AiVsHumanService#render_player' do
              ply.should_receive :render_player
              ply.instance_variable_set :@service, service
              ply.register_callbacks
              service.send :render_player, double(:mark)
            end

            it 'should call #render_position on AiVsHumanService#render_position' do
              ply.should_receive :render_position
              ply.instance_variable_set :@service, service
              ply.register_callbacks
              service.send :render_position, double(:number)
            end

            it 'should call #render_invalid_position on AiVsHumanService#render_invalid_position' do
              ply.should_receive :render_invalid_position
              ply.instance_variable_set :@service, service
              ply.register_callbacks
              service.send :render_invalid_position
            end

          end

          describe '#start' do
            let(:service) { AiVsHumanService.new double(:board_state) }
            it 'should call AiVsHumanService#call' do
              service.should_receive :call
              ply.instance_variable_set :@service, service
              ply.start
            end
          end

        end

        context 'with views ' do
          let(:input)       { double :input }
          let(:output)      { double(:output).as_null_object }
          let(:board_state) { double :board_state }
          let(:ply)         { PlyController.new input, output, length, board_state }
          let(:number)      { 1 }
          let(:best)        { double :win_position, :next_position_number => number }
          let(:positions)   { [] }

          describe '#render_player' do
            it 'should call PlyPlayerView.new#render' do
              player_view = double :ply_player_view
              player_view.should_receive :render
              ply.ply_player_view_source = ->(output, player_mark){ player_view }
              ply.render_player 'X'
            end
          end

          describe '#render_position' do
            it 'should call PlyPositionView.new#render' do
              position_view = double :ply_position_view
              position_view.should_receive :render
              ply.ply_position_view_source = ->(output, number){ position_view }
              ply.render_position 'X'
            end
          end

          describe '#render_invalid_position' do
            it 'should call PlyInvalidPositionView.new#render' do
              invalid_position_view = double :ply_invalid_position_view
              invalid_position_view.should_receive :render
              ply.ply_invalid_position_view_source = ->(output){ invalid_position_view }
              ply.render_invalid_position
            end
          end

          describe '#render_board' do

            it 'should call PlyBoardView.new#render' do
              board_view = double :ply_board_view
              board_view.should_receive :render
              ply.ply_board_view_source = ->(output, board){ board_view }
              ply.stub(:new_ply_board_presenter) { double :presenter, :call => nil }
              ply.render_board positions
            end

            it 'should call PlyBoardPresenter.new#call' do
              board_presenter = double :ply_board_presenter
              board_presenter.should_receive :call
              ply.ply_board_presenter_source = ->(positions, length){ board_presenter }
              ply.stub(:new_ply_board_view) { double :view, :render => nil }
              ply.render_board positions
            end

          end

        end

        context 'with input' do
          let(:input)       { double :input }
          let(:output)      { double(:output).as_null_object }
          let(:board_state) { double :board_state }
          let(:ply)         { PlyController.new input, output, length, board_state }
          describe '#get_position' do
            it 'should call #getc' do
              input.should_receive(:getc) { 1 }
              ply.get_position
            end
          end
        end

      end

    end
  end
end
