require 'spec_helper'
require 'data/player'
require 'data/board_state'
require 'contexts/place_mark_context'

describe PlaceMarkContext do
  let(:board_state) { BoardState.new 3, Player.none, Player.X }

  describe '#call' do
    context 'with a number' do
      let(:number) { 5 }

      it 'should call #place_mark with the number' do
        context = PlaceMarkContext.new(board_state, number)
        context.board_state.should_receive(:place_mark).with(context.number)
        context.call
      end
    end
  end
end
