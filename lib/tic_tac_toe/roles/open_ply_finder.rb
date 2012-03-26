module TicTacToe
  module OpenPlyFinder

    def empty_spaces
      spaces = []
      self.positions.each_with_index do |s, i|
        spaces << i if s.none?
      end
      spaces
    end

  end
end
