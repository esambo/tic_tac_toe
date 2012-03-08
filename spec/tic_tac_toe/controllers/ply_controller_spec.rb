require 'spec_helper'
require 'tic_tac_toe/controllers/ply_controller'
require 'tic_tac_toe/presenters/ply_board_presenter'
require 'tic_tac_toe/views/ply_board_view'
require 'tic_tac_toe/views/ply_position_view'
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
        let(:ply) { PlyController.new output, length }
        let(:output) { double('output').as_null_object }

        it 'should call #render_board' do
          ply.stub(:ai_ply)
          ply.should_receive(:render_board)
          board_state = double :board_state, :positions => nil
          ply.ai_vs_human board_state
        end

        it 'should call #ai_ply' do
          ply.stub(:render_board)
          ply.should_receive(:ai_ply)
          board_state = double :board_state, :positions => nil
          ply.ai_vs_human board_state
        end

      end

      describe '#ai_ply' do
        let(:output) { double(:output).as_null_object }
        let(:ply)    { PlyController.new output, length }
        let(:number) { 1 }
        let(:best)   { double :win_position, :next_position_number => number }

        it 'should call BestPositionContext.new#call' do
          ply.stub(:place_mark) { double :response, :positions => [] }
          ply.stub :render_board
          context = double :best_position_context
          context.should_receive(:call) { best }
          ply.best_position_context_source = ->(board_state){ context }
          ply.ai_ply double(:board_state)
        end

        it 'should call PlyPositionView.new#render' do
          ply.stub(:place_mark) { double :response, :positions => [] }
          ply.stub :render_board
          ply.stub(:best_position) { best }
          position_view = double :ply_position_view
          position_view.should_receive(:render)
          ply.ply_position_view_source = ->(output, player_mark, number){ position_view }
          ply.ai_ply double(:board_state)
        end

        it 'should call PlaceMarkContext.new#call' do
          ply.stub(:best_position) { best }
          ply.stub :render_board
          response_set = double :response_set, :positions => [], :terminal => false
          context = double :place_mark_context
          context.should_receive(:call) { response_set }
          ply.place_mark_context_source = ->(b_s, nbr){ context }
          board_state = double :board_state
          ply.ai_ply board_state
        end

        it 'should call PlyBoardView.new#render' do
          ply.stub(:best_position) { best }
          response = double :response, :positions => [], :terminal => false
          ply.stub(:place_mark) { response }
          board_view = double :ply_board_view
          board_view.should_receive(:render)
          ply.ply_board_view_source = ->(output, board){ board_view }
          board_state = double :board_state
          ply.stub(:new_ply_board_presenter) { double :presenter, :call => nil }
          ply.ai_ply board_state
        end

        it 'should call PlyBoardPresenter.new#call' do
          ply.stub(:best_position) { best }
          response = double :response, :positions => [], :terminal => false
          ply.stub(:place_mark) { response }
          board_presenter = double :ply_board_presenter
          board_presenter.should_receive(:call)
          ply.ply_board_presenter_source = ->(positions, length){ board_presenter }
          board_state = double :board_state
          ply.stub(:new_ply_board_view) { double :view, :render => nil }
          ply.ai_ply board_state
        end

      end

    end
  end
end
