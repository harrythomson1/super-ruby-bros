class LevelTwo

  def draw
    @platform = Rectangle.new(x: 0, y: Window.height - 10, height: 10, width: 100, color: 'green', z: 1)
    @platform2 = Rectangle.new(x: 200, y: Window.height - 10, height: 10, width: 250, color: 'green', z: 1)
    @platform3 = Rectangle.new(x: 525, y: Window.height - 10, height: 10, width: 40, color: 'green', z: 1)
    @platform4 = Rectangle.new(x: 650, y: Window.height - 10, height: 10, width: 100, color: 'green', z: 1)
    @platform5 = Rectangle.new(x: Window.width - 100, y: Window.height - 90, height: 10, width: 100, color: 'green', z: 1)
    @platform6 = Rectangle.new(x: Window.width - 70, y: Window.height - 160, height: 10, width: 70, color: 'green', z: 1)
    @platform7 = Rectangle.new(x: Window.width - 35, y: Window.height - 230, height: 10, width: 35, color: 'green', z: 1)
    @platform8 = Rectangle.new(x: 700, y: Window.height - 250, height: 10, width: 75, color: 'green', z: 1)
    @platform9 = Rectangle.new(x: 550, y: Window.height - 160, height: 10, width: 100, color: 'green', z: 1)
    @platform10 = Rectangle.new(x: 350, y: Window.height - 160, height: 10, width: 100, color: 'green', z: 1)
    @platform11 = Rectangle.new(x: 200, y: Window.height - 230, height: 10, width: 100, color: 'green', z: 1)
    @platform12 = Rectangle.new(x: 150, y: Window.height - 300, height: 10, width: 40, color: 'green', z: 1)
    @platform13 = Rectangle.new(x: 0, y: Window.height - 350, height: 10, width: 100, color: 'green', z: 1)
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
    @platform8.contains?(x4, y4) ||
    @platform9.contains?(x3, y3) ||
    @platform9.contains?(x4, y4) ||
    @platform10.contains?(x3, y3) ||
    @platform10.contains?(x4, y4) ||
    @platform11.contains?(x3, y3) ||
    @platform11.contains?(x4, y4) ||
    @platform12.contains?(x3, y3) ||
    @platform12.contains?(x4, y4) ||
    @platform13.contains?(x3, y3) ||
    @platform13.contains?(x4, y4)
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
    @platform8.contains?(x2, y2) ||
    @platform9.contains?(x1, y1) ||
    @platform9.contains?(x2, y2) ||
    @platform10.contains?(x1, y1) ||
    @platform10.contains?(x2, y2) ||
    @platform11.contains?(x1, y1) ||
    @platform11.contains?(x2, y2) ||
    @platform12.contains?(x1, y1) ||
    @platform12.contains?(x2, y2) ||
    @platform13.contains?(x1, y1) ||
    @platform13.contains?(x2, y2)
  end
end
