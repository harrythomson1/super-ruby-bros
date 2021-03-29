class LevelOne

  def initialize
    @platforms = [ Rectangle.new(x: 0, y: Window.height - 10, color: 'green', height: 10, z: 3, width: Window.width),
      Rectangle.new(x: (Window.width - 200) / 2, y: Window.height - 85, color: 'green', height: 10, z: 3, width: 200),
      Rectangle.new(x: 0, y: Window.height - 165, color: 'green', height: 10, z: 3, width: 350),
      Rectangle.new(x: Window.width - 350, y: Window.height - 175, color: 'green', height: 10, z: 3, width: 350),
      Rectangle.new(x: (Window.width - 200) / 2, y: Window.height - 250, color: 'green', height: 10, z: 3, width: 200),
      Rectangle.new(x: 300, y: Window.height - 325, color: 'green', height: 10, z: 3, width: 100),
      Rectangle.new(x: 150, y: Window.height - 400, color: 'green', height: 10, z: 3, width: 100),
      Rectangle.new(x: 0, y: Window.height - 475, color: 'green', height: 10, z: 3, width: 100)]
  end

  def collision (x3, y3, x4, y4)
    @platform.contains?(x3, y3) ||
    @platform.contains?(x4, y4) ||
    @platform2.contains?(x3, y3) ||
    @platform2.contains?(x4, y4) ||
    @platform3.contains?(x3, y3) ||
    @platform3.contains?(x4, y4) ||
    @platform4.contains?(x3, y3) ||
    @platform4.contains?(x4, y4) ||
    @platform5.contains?(x3, y3) ||
    @platform5.contains?(x4, y4) ||
    @platform6.contains?(x3, y3) ||
    @platform6.contains?(x4, y4) ||
    @platform7.contains?(x3, y3) ||
    @platform7.contains?(x4, y4) ||
    @platform8.contains?(x3, y3) ||
    @platform8.contains?(x4, y4)
  end

  def collision_bottom (x1, y1, x2, y2)
    @platform.contains?(x1, y1) ||
    @platform.contains?(x2, y2) ||
    @platform2.contains?(x1, y1) ||
    @platform2.contains?(x2, y2) ||
    @platform3.contains?(x1, y1) ||
    @platform3.contains?(x2, y2) ||
    @platform4.contains?(x1, y1) ||
    @platform4.contains?(x2, y2) ||
    @platform5.contains?(x1, y1) ||
    @platform5.contains?(x2, y2) ||
    @platform6.contains?(x1, y1) ||
    @platform6.contains?(x2, y2) ||
    @platform7.contains?(x1, y1) ||
    @platform7.contains?(x2, y2) ||
    @platform8.contains?(x1, y1) ||
    @platform8.contains?(x2, y2)
  end
end
