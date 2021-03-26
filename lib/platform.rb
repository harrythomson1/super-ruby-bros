class Platform
  
  attr_reader :y, :height

  def initialize(x:, y:, z: 0, height:, width:, color:)
    @x = x
    @y = y
    @height = height
    @width = width
    @color = color
    @z = z
  end

  def draw
    @platform = Rectangle.new(x: @x, y: @y, z: @z, width: @width, height: @height, color: @color)
  end

  def collision_top (x3, y3, x4, y4)
    @platform.contains?(x3, y3) ||
    @platform.contains?(x4, y4)
  end

end