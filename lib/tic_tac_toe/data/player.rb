module TicTacToe
  Player = Struct.new(:mark) do

    def initialize(mark)
      self.mark = mark.upcase.to_sym
      self.mark = :none unless X? or O?
    end

    def self.X
      Player.new :X
    end

    def self.O
      Player.new :O
    end

    def self.none
      Player.new :none
    end

    def self.draw
      self.none
    end

    def X?
      self.mark == :X
    end

    def O?
      self.mark == :O
    end

    def none?
      self.mark == :none
    end

    def draw?
      none?
    end

    def turn
      Player.new X? ? :O : :X
    end

    def to_i
      return  1 if X?
      return -1 if O?
      return  0
    end

    def to_s
      draw? ? ' ' : self.mark.to_s
    end

  end
end
