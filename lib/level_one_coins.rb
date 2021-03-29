class LevelOneCoins

  REMOVE_COIN = 1000

  def initialize
    @y1 = Window.height - 285
    @y2 = Window.height - 285
    @y3 = Window.height - 285
  end

  def draw
    @coin = Square.new(x: Window.width - 250, y: @y1, size: 25, color: 'yellow')
    @coin2 = Square.new(x: Window.width - 200, y: @y2, size: 25, color: 'yellow')
    @coin3 = Square.new(x: Window.width - 150, y: @y3, size: 25, color: 'yellow')
  end

  def collision_coin (x1, y1, x2, y2, x3, y3, x4, y4) 
    @coin.contains?(x1, y1) ||
    @coin.contains?(x2, y2) ||  
    @coin.contains?(x3, y3) ||
    @coin.contains?(x4, y4)
  end

  def collision_coin2 (x1, y1, x2, y2, x3, y3, x4, y4) 
    @coin2.contains?(x1, y1) ||
    @coin2.contains?(x2, y2) ||  
    @coin2.contains?(x3, y3) ||
    @coin2.contains?(x4, y4)
  end

  def collision_coin3 (x1, y1, x2, y2, x3, y3, x4, y4) 
    @coin3.contains?(x1, y1) ||
    @coin3.contains?(x2, y2) ||  
    @coin3.contains?(x3, y3) ||
    @coin3.contains?(x4, y4)
  end

  def move_coin
    @y1 = REMOVE_COIN
  end

  def move_coin2
    @y2 = REMOVE_COIN
  end

  def move_coin3
    @y3 = REMOVE_COIN
  end

end