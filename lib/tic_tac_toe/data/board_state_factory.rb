module TicTacToe
  class BoardStateFactory

    def initialize(length)
      @length = length
    end

    def call
      emtpy_space  = Player.none
      first_player = Player.X
      board_state  = BoardState.new @length, emtpy_space, first_player
    end

  end
end
