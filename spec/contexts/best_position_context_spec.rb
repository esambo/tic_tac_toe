require 'spec_helper'
require 'contexts/best_position_context'

describe BestPositionContext do
  let(:board_state) { double('BoardState').as_null_object }
  before :each do
    board_state.stub(:extend)
  end

  describe '#call' do
    let(:context) { BestPositionContext.new(board_state) }

    it 'should calls #best_position' do
      context.board_state.should_receive(:best_position)
      context.call
    end
  end
end
