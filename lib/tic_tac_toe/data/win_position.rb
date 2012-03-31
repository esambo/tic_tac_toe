module TicTacToe
  WinPosition = Struct.new(:ply_number, :rank, :winner, :path) do

    def next_position_number
      self.path.split.last.chars.first.to_i
    end

  end
end
