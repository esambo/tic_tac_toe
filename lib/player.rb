Player = Struct.new(:current) do

  def initialize(current)
    self.current = current.downcase.to_sym
  end

  def self.x
    Player.new :x
  end

  def self.none
    Player.new :none
  end

  def x?
    self.current == :x
  end

  def o?
    self.current == :o
  end

  def none?
    self.current == :none
  end

  def turn
    Player.new x? ? :o : :x
  end
end
