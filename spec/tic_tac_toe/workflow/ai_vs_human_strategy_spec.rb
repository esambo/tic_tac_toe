require 'spec_helper'
require 'tic_tac_toe/workflow/ai_vs_human_strategy'
require 'tic_tac_toe/data/player'

module TicTacToe
  module UI
    describe AiVsHumanStrategy do
      let(:ply)      { double(:ply_controller).as_null_object }
      let(:strategy) { AiVsHumanStrategy.new ply }

      describe '#new' do
        it 'should set @ply controller' do
          strategy.instance_variable_get(:@ply).should == ply
        end
      end

      describe '#call' do
        let(:board_state) { double :board_state, :positions => nil }
        before :each do
          ply.stub(:board_state) { board_state }
          strategy.stub(:ai_ply)
          strategy.stub(:human_ply)
        end

        it 'should delegate to #render_board' do
          ply.should_receive :render_board
          strategy.call
        end

        it 'should call #ai_ply' do
          strategy.should_receive(:ai_ply)
          strategy.call
        end

        it 'should call #human_ply' do
          strategy.should_receive(:human_ply)
          strategy.call
        end

      end

      describe '#ai_ply' do
        let(:number)   { 1 }
        let(:best)     { double :win_position, :next_position_number => number }
        let(:response) { double :response, :positions => [] }
        before :each do
          ply.stub(:best_position) { best }
          ply.stub(:place_mark) { response }
        end

        it 'should delegate #best_position' do
          ply.should_receive(:best_position) { best }
          strategy.send :ai_ply
        end

        it 'should delegate #render_position' do
          ply.should_receive :render_position
          strategy.send :ai_ply
        end

        it 'should delegate #place_mark' do
          ply.should_receive(:place_mark) { response }
          strategy.send :ai_ply
        end

        it 'should delegate #render_board' do
          ply.should_receive :render_board
          strategy.send :ai_ply
        end

        context 'workflow' do
          it 'should delegate #best_position, #render_position, #place_mark, #render_board in that order' do
            ply.should_receive(:best_position).ordered { best }
            ply.should_receive(:render_position).ordered
            ply.should_receive(:place_mark).ordered { response }
            ply.should_receive(:render_board).ordered
            strategy.send :ai_ply
          end
        end

      end

      describe '#human_ply' do
        before :each do
          ply.stub(:place_mark) { stub :response, :positions => [] }
        end

        it 'should delegate #render_position' do
          ply.should_receive :render_position
          strategy.send :human_ply
        end

        it 'should delegate #get_position' do
          ply.should_receive(:get_position) { 1 }
          strategy.send :human_ply
        end

        it 'should delegate #place_mark' do
          ply.should_receive :place_mark
          strategy.send :human_ply
        end

        it 'should delegate #render_board' do
          ply.should_receive :render_board
          strategy.send :human_ply
        end

      end

    end
  end
end
