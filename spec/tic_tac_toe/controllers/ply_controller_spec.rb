require 'spec_helper'
require 'tic_tac_toe/controllers/ply_controller'
require 'tic_tac_toe/data/player'

module TicTacToe
  module UI
    describe PlyController do
      let(:length) { 3 }

      describe '#new' do
        let(:output) { double('output').as_null_object }
        let(:ply)    { PlyController.new output, length }
        it 'should set @output' do
          ply.instance_variable_get(:@output).should == output
        end
      end

      describe '#ai_vs_human' do
        let(:ply)         { PlyController.new output, length }
        let(:output)      { double('output').as_null_object }
        let(:board_state) { double(:board_state, :positions => nil) }
        before :each do
          ply.stub(:ai_ply)
          ply.stub(:render_board)
          ply.stub(:human_ply)
        end

        it 'should call #render_board' do
          ply.should_receive(:render_board)
          ply.ai_vs_human(board_state)
        end

        it 'should call #ai_ply' do
          ply.should_receive(:ai_ply)
          ply.ai_vs_human(board_state)
        end

        it 'should call #human_ply' do
          ply.should_receive(:human_ply)
          ply.ai_vs_human(board_state)
        end

      end

      describe '#ai_ply' do
        let(:output)      { double(:output).as_null_object }
        let(:ply)         { PlyController.new output, length }
        let(:number)      { 1 }
        let(:best)        { double :win_position, :next_position_number => number }
        let(:response)    { double :response, :positions => [] }
        let(:board_state) { double :board_state }
        before :each do
          ply.stub(:best_position) { best }
          ply.stub(:place_mark) { response }
          ply.stub(:render_position)
          ply.stub(:render_board)
        end

        it 'should call #best_position' do
          ply.should_receive(:best_position) { best }
          ply.ai_ply(board_state)
        end

        it 'should call #render_position' do
          ply.should_receive :render_position
          ply.ai_ply(board_state)
        end

        it 'should call #place_mark' do
          ply.should_receive(:place_mark) { response }
          ply.ai_ply(board_state)
        end

        it 'should call #render_board' do
          ply.should_receive :render_board
          ply.ai_ply(board_state)
        end

        context 'workflow' do
          it 'should call #best_position, #render_position, #place_mark, #render_board in that order' do
            ply.should_receive(:best_position).ordered { best }
            ply.should_receive(:render_position).ordered
            ply.should_receive(:place_mark).ordered { response }
            ply.should_receive(:render_board).ordered
            ply.ai_ply(board_state)
          end
        end

      end

      describe '#human_ply' do
        let(:output)      { double(:output).as_null_object }
        let(:ply)         { PlyController.new output, length }
        let(:board_state) { double :board_state }

        it 'should call #render_position' do
          ply.should_receive :render_position
          ply.human_ply board_state
        end

      end

      describe 'integration' do

        context 'with contexts ' do
          let(:output)      { double :output }
          let(:ply)         { PlyController.new output, length }
          let(:number)      { 1 }
          let(:board_state) { double :board_state }

          describe '#best_position' do
            it 'should call BestPositionContext.new#call' do
              context = double :best_position_context
              context.should_receive :call
              ply.best_position_context_source = ->(board_state){ context }
              ply.send :best_position, board_state
            end
          end

          describe '#place_mark' do
            it 'should call PlaceMarkContext.new#call' do
              context = double :place_mark_context
              context.should_receive :call
              ply.place_mark_context_source = ->(board_state, number){ context }
              ply.send :place_mark, board_state, number
            end
          end

        end

        context 'with views ' do
          let(:output)      { double(:output).as_null_object }
          let(:ply)         { PlyController.new output, length }
          let(:number)      { 1 }
          let(:board_state) { double :board_state }
          let(:best)        { double :win_position, :next_position_number => number }
          let(:positions)   { [] }

          describe '#render_position' do
            it 'should call PlyPositionView.new#render' do
              position_view = double :ply_position_view
              position_view.should_receive :render
              ply.ply_position_view_source = ->(output, player_mark, number){ position_view }
              ply.send :render_position, 'X', number
            end
          end

          describe '#render_board' do

            it 'should call PlyBoardView.new#render' do
              board_view = double :ply_board_view
              board_view.should_receive :render
              ply.ply_board_view_source = ->(output, board){ board_view }
              ply.stub(:new_ply_board_presenter) { double :presenter, :call => nil }
              ply.send :render_board, positions
            end

            it 'should call PlyBoardPresenter.new#call' do
              board_presenter = double :ply_board_presenter
              board_presenter.should_receive :call
              ply.ply_board_presenter_source = ->(positions, length){ board_presenter }
              ply.stub(:new_ply_board_view) { double :view, :render => nil }
              ply.send :render_board, positions
            end

          end

        end

      end

    end
  end
end
