require 'spec_helper'
require 'data/response_set'
require 'contexts/place_mark_context'

describe PlaceMarkContext do
  let(:board_state) { double('BoardState').as_null_object }
  before :each do
    board_state.stub(:extend)
  end

  describe '#call' do
    context 'with a position number' do
      let(:number) { 5 }
      let(:context) { PlaceMarkContext.new(board_state, number) }

      it 'should call #place_mark with the number' do
        context.board_state.should_receive(:place_mark).with(number)
        context.call
      end

      context 'without a valid ply' do
        before :each do
          context.board_state.stub(:place_mark) { true }
        end

        it 'should call #winner' do
          context.board_state.should_receive(:winner)
          context.call
        end
      end

      context 'without a valid ply' do
        before :each do
          context.board_state.stub(:place_mark) { false }
        end

        it 'should not call #winner' do
          context.board_state.should_not_receive(:winner)
          context.call
        end
      end

      describe 'responds with result set and' do

        it 'should including valid_ply' do
          valid_ply = true
          context.board_state.should_receive(:place_mark) { valid_ply }
          response_set = context.call
          response_set.valid_ply.should == valid_ply
        end

        it 'should include next_player' do
          next_player = double(:Player_O)
          context.board_state.should_receive(:next_player) { next_player }
          response_set = context.call
          response_set.next_player.should == next_player
        end

        it 'should include positions' do
          positions = [double(:Player_O), double(:Player_none)]
          context.board_state.should_receive(:positions) { positions }
          response_set = context.call
          response_set.positions.should == positions
        end

        context 'with a valid ply' do
          before :each do
            context.board_state.stub(:place_mark) { true }
          end

          it 'should include winner' do
            winner = false
            context.board_state.should_receive(:winner) { winner }
            response_set = context.call
            response_set.winner.should == winner
          end

          it 'should include terminal as true when the game is finished' do
            terminal = true
            context.board_state.should_receive(:winner) { double(:Player_none) }
            response_set = context.call
            response_set.terminal.should == terminal
          end

          it 'should include terminal as false when the game is not finished' do
            terminal = false
            context.board_state.stub(:winner) { nil }
            response_set = context.call
            response_set.terminal.should == terminal
          end
        end

        context 'without a valid ply' do
          before :each do
            context.board_state.stub(:place_mark) { false }
          end

          it 'should not include a terminal value' do
            terminal = nil
            context.board_state.should_not_receive(:winner)
            response_set = context.call
            response_set.terminal.should == terminal
          end

          it 'should not include a winner value' do
            winner = nil
            context.board_state.should_not_receive(:winner)
            response_set = context.call
            response_set.winner.should == winner
          end
        end
      end
    end
  end
end
