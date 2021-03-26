class Coin
  
  attr_writer :x, :y
  attr_accessor :count

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def draw
    @coin = Square.new(x: @x, y: @y, size: 30)
  end

  def collision (x1, y1, x2, y2, x3, y3, x4, y4) 
    @coin.contains?(x1, y1) ||
    @coin.contains?(x2, y2) ||  
    @coin.contains?(x3, y3) ||
    @coin.contains?(x4, y4)
  end

end