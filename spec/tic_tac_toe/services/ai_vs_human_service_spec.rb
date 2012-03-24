require 'spec_helper'
require 'tic_tac_toe/services/ai_vs_human_service'
require 'tic_tac_toe/data/player'

module TicTacToe
  module UI
    describe AiVsHumanService do
      let(:controller)  { double(:ply_controller).as_null_object }
      let(:board_state) { double :board_state }
      let(:service)     { AiVsHumanService.new board_state }

      describe '#new' do
        it 'should set @board_state controller' do
          service.instance_variable_get(:@board_state).should == board_state
        end
      end

      describe '#call' do
        let(:board_state) { double :board_state, :positions => [] }
        let(:response)    { double :response, :terminal => true }
        before :each do
          service.stub :ai_ply    => response
          service.stub :human_ply => response
        end

        it 'should call #render_board hook' do
          controller.should_receive :render_board
          service.on_render_board do |event, positions|
            controller.render_board positions
          end
          service.call
        end

        it 'should call #ai_ply' do
          service.should_receive(:ai_ply)
          service.call
        end

        it 'should call #human_ply' do
          service.stub(:ai_ply).and_return double :response, :terminal => false
          service.should_receive(:human_ply)
          service.call
        end

        it 'should all board_state#terminal' do
          response.should_receive :terminal
          service.call
        end

        context 'with 3 plies (ai, human, ai) before terminal game' do
          let(:board_state) { double :board_state, :positions => [] }
          let(:response)    { double :response }
          before :each do
            response.stub(:terminal).and_return false, false, true
            service.stub  :ai_ply    => response
            service.stub  :human_ply => response
          end
          it 'should call #ai_ply twice' do
            service.should_receive(:ai_ply).twice
            service.should_receive(:human_ply).once
            service.call
          end
        end

        context 'with 4 plies (ai, human, ai, human) before terminal game' do
          let(:board_state) { double :board_state, :positions => [] }
          let(:response)    { double :response }
          before :each do
            response.stub(:terminal).and_return false, false, false, true
            service.stub  :ai_ply    => response
            service.stub  :human_ply => response
          end
          it 'should call #ai_ply twice' do
            service.should_receive(:ai_ply).twice
            service.should_receive(:human_ply).twice
            service.call
          end
        end

      end

      describe '#ai_ply' do
        let(:number)   { 1 }
        let(:best)     { double :win_position, :next_position_number => number }
        let(:response) { double :response, :positions => [] }
        before :each do
          service.stub(:best_position) { best }
          service.stub(:place_mark)    { response }
        end

        it 'should call #render_player hook' do
          controller.should_receive :render_player
          service.on_render_player do |event, mark|
            controller.render_player mark
          end
          service.ai_ply
        end

        it 'should call #best_position' do
          service.should_receive(:best_position) { best }
          service.ai_ply
        end

        it 'should call #render_position hook' do
          controller.should_receive :render_position
          service.on_render_position do |event, number|
            controller.render_position number
          end
          service.ai_ply
        end

        it 'should call #place_mark' do
          service.should_receive(:place_mark) { response }
          service.ai_ply
        end

        it 'should call #render_board hook' do
          controller.should_receive :render_board
          service.on_render_board do |event, positions|
            controller.render_board positions
          end
          service.ai_ply
        end

        context 'workflow' do
          it 'should call #render_player, #best_position, #render_position, #place_mark, #render_board in that order' do
            service.should_receive(:render_player).ordered
            service.should_receive(:best_position).ordered { best }
            service.should_receive(:render_position).ordered
            service.should_receive(:place_mark).ordered { response }
            service.should_receive(:render_board).ordered
            service.ai_ply
          end
        end

      end

      describe '#human_ply' do
        before :each do
          service.stub(:place_mark) { stub :response, :positions => [], :valid_ply => true }
        end

        it 'should call #render_player hook' do
          controller.should_receive :render_player
          service.on_render_player do |event, mark|
            controller.render_player mark
          end
          service.human_ply
        end

        it 'should call all #get_position callbacks with a block and get the last return value' do
          called = 0
          service.on_get_position do |event|
            event.next
            called += 1
            8
          end
          service.on_get_position do |event|
            event.next
            called += 1
            9
          end
          position = service.send :get_position
          called.should == 2
          position.should == 9
        end

        context 'with already taken position number once' do
          let(:taken)                { 1 }
          let(:free)                 { 3 }
          let(:valid_ply_response)   { stub :response, :valid_ply => false, :positions => [], :size => 'hello' }
          let(:invalid_ply_response) { stub :response, :valid_ply => true,  :positions => [] }
          before :each do
            service.stub(:get_position).and_return(taken,              free)
            service.stub(:place_mark  ).and_return(valid_ply_response, invalid_ply_response)
            service.stub(:render_board)
          end

          it 'should call #get_position twice' do
            service.should_receive(:render_player).twice
            service.human_ply
          end

          it 'should call #render_invalid_position hook' do
            service.stub(:render_player)
            controller.should_receive :render_invalid_position
            service.on_render_invalid_position do |event|
              controller.render_invalid_position
            end
            service.human_ply
          end

        end

        it 'should call #place_mark' do
          service.should_receive :place_mark
          service.human_ply
        end

        it 'should call #render_board hook' do
          controller.should_receive :render_board
          service.on_render_board do |event, positions|
            controller.render_board positions
          end
          service.human_ply
        end

      end

      describe 'integration' do
        context 'with contexts ' do

          describe '#best_position' do
            it 'should call BestPositionContext.new#call' do
              context = double :best_position_context
              context.should_receive :call
              service.best_position_context_source = ->(board_state){ context }
              service.send :best_position
            end
          end

          describe '#place_mark' do
            it 'should call PlaceMarkContext.new#call' do
              number  = 1
              context = double :place_mark_context
              context.should_receive :call
              service.place_mark_context_source = ->(board_state, number){ context }
              service.send :place_mark, number
            end
          end

        end
      end

    end
	end
end
