require 'spec_helper'
require 'contexts/best_position_number_context'

describe BestPositionNumberContext do
  let(:board_state) { double('BoardState').as_null_object }
  before :each do
    board_state.stub(:extend)
  end

  describe '#call' do
    let(:context) { BestPositionNumberContext.new(board_state) }

    it 'should calls #best_position_number' do
      context.board_state.should_receive(:best_position_number)
      context.call
    end
  end
end
