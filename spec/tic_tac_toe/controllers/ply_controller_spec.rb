require 'spec_helper'
require 'tic_tac_toe/controllers/ply_controller'
require 'tic_tac_toe/workflow/ai_vs_human_strategy'

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
        let(:ply) { PlyController.new nil, nil, nil, nil }
          let(:strategy) { AiVsHumanStrategy.new ply }
          it 'should call #ai_vs_human_strategy' do
            ply.should_receive(:ai_vs_human_strategy)
            ply.ai_vs_human
          end
      end

      describe 'integration' do

        context 'with workflow' do
          let(:ply) { PlyController.new nil, nil, nil, nil }
          describe '#ai_vs_human_strategy' do
            it 'should call AiVsHumanStrategy.new#call' do
              strategy = double :ai_vs_human_strategy
              strategy.should_receive :call
              ply.ai_vs_human_strategy_source = ->(ply){ strategy }
              ply.ai_vs_human
            end
          end
        end

        context 'with contexts ' do
          let(:input)       { double :input }
          let(:output)      { double :output }
          let(:board_state) { double :board_state }
          let(:ply)         { PlyController.new input, output, length, board_state }
          let(:number)      { 1 }

          describe '#best_position' do
            it 'should call BestPositionContext.new#call' do
              context = double :best_position_context
              context.should_receive :call
              ply.best_position_context_source = ->(board_state){ context }
              ply.best_position
            end
          end

          describe '#place_mark' do
            it 'should call PlaceMarkContext.new#call' do
              context = double :place_mark_context
              context.should_receive :call
              ply.place_mark_context_source = ->(board_state, number){ context }
              ply.place_mark number
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

          describe '#render_position' do
            it 'should call PlyPositionView.new#render' do
              position_view = double :ply_position_view
              position_view.should_receive :render
              ply.ply_position_view_source = ->(output, player_mark, number){ position_view }
              ply.render_position 'X', number
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
