module TicTacToe
  class BoardStateSequenceFactory

    def initialize(length, sequence = nil)
      @length   = length
      @sequence = sequence
    end

    def call
      board_state = BoardStateFactory.new(@length).call
      @sequence.each do |number|
        PlaceMarkContext.new(board_state, number).call
      end
      board_state
    end

  end
end
