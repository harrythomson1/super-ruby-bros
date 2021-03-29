class LevelTwo

  def draw
    @platform = Rectangle.new(x: 0, y: Window.height - 10, height: 10, width: 100, color: 'green', z: 1)
    @platform2 = Rectangle.new(x: 200, y: Window.height - 10, height: 10, width: 250, color: 'green', z: 1)
    @platform3 = Rectangle.new(x: 525, y: Window.height - 10, height: 10, width: 40, color: 'green', z: 1)
    @platform4 = Rectangle.new(x: 650, y: Window.height - 10, height: 10, width: 100, color: 'green', z: 1)
  end

  def collision (x3, y3, x4, y4)
    @platform.contains?(x3, y3) ||
    @platform.contains?(x4, y4) ||
    @platform2.contains?(x3, y3) ||
    @platform2.contains?(x4, y4) ||
    @platform3.contains?(x3, y3) ||
    @platform3.contains?(x4, y4) ||
    @platform4.contains?(x3, y3) ||
    @platform4.contains?(x4, y4)
  end

  def collision_bottom (x1, y1, x2, y2)
    @platform.contains?(x1, y1) ||
    @platform.contains?(x2, y2) ||
    @platform2.contains?(x1, y1) ||
    @platform2.contains?(x2, y2) ||
    @platform3.contains?(x1, y1) ||
    @platform3.contains?(x2, y2) ||
    @platform4.contains?(x1, y1) ||
    @platform4.contains?(x2, y2)

  end
end
