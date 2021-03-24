class Platform
  
  attr_reader :y, :height

  def initialize(x, y)
    @x = x
    @y = y
    @height = 50
  end

  def draw
    @platform = Rectangle.new(x: @x, y: @y, width: 200, height: @height, color: 'green')
  end

  def collision_left(x2, y2)
    @platform.contains?(x2, y2)
  end

  def collision_right(x1, y1)
    @platform.contains?(x1, y1)
  end

  def collision_top (x3, y3, x4, y4)
    @platform.contains?(x3, y3) ||
    @platform.contains?(x4, y4)
  end

end