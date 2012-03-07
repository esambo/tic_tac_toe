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
          ply.should_receive(:render_board).with(an_instance_of Array)
          board_state = double :board_state, :positions => []
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

        it 'should call BestPositionContext' do
          ply.stub(:place_mark) { double :response, :positions => [] }
          ply.stub :render_board
          context = double :best_position_context
          context.should_receive(:call) { best }
          ply.best_position_context_source = ->(board_state){ context }
          ply.ai_ply double(:board_state)
        end

        it 'should call #render_position' do
          ply.stub(:place_mark) { double :response, :positions => [] }
          ply.stub :render_board
          ply.best_position_context_source = ->(board_state){ double(:best_position_context, :call => best) }
          ply.should_receive(:render_position).with('X', an_instance_of(Fixnum))
          ply.ai_ply double(:board_state)
        end

        it 'should call PlaceMarkContext' do
          ply.stub(:best_position) { best }
          ply.stub :render_board
          response_set = double :response_set, :positions => [], :terminal => false
          context = double :place_mark_context
          context.should_receive(:call) { response_set }
          ply.place_mark_context_source = ->(b_s, nbr){ context }
          board_state = double :board_state
          ply.ai_ply board_state
        end

        it 'should call #render_board' do
          ply.stub(:best_position) { best }
          response = double :response, :positions => [], :terminal => false
          ply.stub(:place_mark) { response }
          ply.should_receive(:render_board).with(an_instance_of Array)
          board_state = double :board_state
          ply.ai_ply board_state
        end

      end

      describe 'integration with view ' do
        before :each do
          module PutString
            def puts(str)
              self << str
            end
          end
          def output
            @output ||= [].extend PutString
          end
        end
        let(:ply) { PlyController.new output, length }

        describe '#render_board' do
          it 'should output board' do
            positions = ['X', 'X', 'X', 'O', 'O', 'O', ' ', ' ', ' ']
            ply.send :render_board, positions
            output.should include('+---+---+---+')
          end
        end

        describe '#render_position' do
          context "with player 'X' at position number 8" do
            let(:player_mark) { 'X' }
            let(:number)      {  8  }
            it 'should output player mark and position number' do
              ply.send :render_position, player_mark, number
              output.should include('X player ply position number: 8')
            end
          end
        end

      end

    end
  end
end
