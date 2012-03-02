require 'tic_tac_toe/roles/mark_placer'
require 'tic_tac_toe/roles/winner'
require 'tic_tac_toe/roles/take_turns'

module TicTacToe
  class PlaceMarkContext
    attr_reader :board_state, :number

    def initialize(board_state, number)
      @board_state = board_state
      @number      = number
    end

    def call
      place_mark and winner
      response
    end

    private

      def place_mark
        @board_state.extend MarkPlacer
        @board_state.extend TakeTurns
        @valid_ply   = @board_state.place_mark @number
        @next_player = @board_state.next_player
        @positions   = @board_state.positions
        @valid_ply
      end

      def winner
        @board_state.extend Winner
        @winner   = @board_state.winner
        @terminal = !@winner.nil?
      end

      def response
        ResponseSet.new(
          @valid_ply,
          @next_player,
          @positions,
          @terminal,
          @winner
        )
      end

  end
end
