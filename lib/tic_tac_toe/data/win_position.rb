module TicTacToe
  WinPosition = Struct.new(:ply_number, :rank, :winner, :path) do

    def next_position_number
      self.path.chars.to_a[-2].to_i
    end

    def position_number=(number)
      self.path ||= ''
      self.path  += number.to_s
    end

  end
end
