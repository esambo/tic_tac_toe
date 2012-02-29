module TicTacToe
  ResponseSet = Struct.new(
    :valid_ply,
    :next_player,
    :positions,
    :terminal,
    :winner
  )

end
