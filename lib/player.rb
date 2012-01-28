Player = Struct.new(:current) do
  def self.x
    Player.new :x
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
