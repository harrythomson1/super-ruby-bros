class Platform
  
  def initialize(x, y)
    @x = x
    @y = y
  end

  def draw
    Rectangle.new(x: @x, y: @y, width: 200, height: 50, color: 'green')
  end

end