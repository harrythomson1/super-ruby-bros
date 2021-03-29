class LevelTwo

  attr_accessor :platforms

def initialize
  @platforms = [Rectangle.new(x: 0, y: Window.height - 10, height: 10, width: 100, color: 'green', z: 1),
    Rectangle.new(x: 200, y: Window.height - 10, height: 10, width: 250, color: 'green', z: 1),
    Rectangle.new(x: 525, y: Window.height - 10, height: 10, width: 40, color: 'green', z: 1),
    Rectangle.new(x: 650, y: Window.height - 10, height: 10, width: 100, color: 'green', z: 1),
    Rectangle.new(x: Window.width - 100, y: Window.height - 90, height: 10, width: 100, color: 'green', z: 1),
    Rectangle.new(x: Window.width - 70, y: Window.height - 160, height: 10, width: 70, color: 'green', z: 1),
    Rectangle.new(x: Window.width - 35, y: Window.height - 230, height: 10, width: 35, color: 'green', z: 1),
    Rectangle.new(x: 700, y: Window.height - 250, height: 10, width: 75, color: 'green', z: 1),
    Rectangle.new(x: 550, y: Window.height - 160, height: 10, width: 100, color: 'green', z: 1),
    Rectangle.new(x: 350, y: Window.height - 160, height: 10, width: 100, color: 'green', z: 1),
    Rectangle.new(x: 200, y: Window.height - 230, height: 10, width: 100, color: 'green', z: 1),
    Rectangle.new(x: 150, y: Window.height - 300, height: 10, width: 40, color: 'green', z: 1),
    Rectangle.new(x: 0, y: Window.height - 350, height: 10, width: 100, color: 'green', z: 1),
    Rectangle.new(x: 175, y: Window.height - 400, height: 10, width: 50, color: 'green', z: 1),
    Rectangle.new(x: 320, y: Window.height - 350, height: 10, width: 30, color: 'green', z: 1),
    Rectangle.new(x: 410, y: Window.height - 430, height: 10, width: 50, color: 'green', z: 1),
    Rectangle.new(x: 550, y: Window.height - 470, height: 10, width: 30, color: 'green', z: 1),
    Rectangle.new(x: 610, y: Window.height - 550, height: 10, width: 30, color: 'green', z: 1),
    Rectangle.new(x: Window.width - 200, y: Window.height - 620, height: 10, width: 200, color: 'green', z: 1)]
end

  def draw
    @platforms.each do |platform|
      platform
    end
  end

  def collision (x3, y3, x4, y4)
    @platforms.each do |platform|
      platform.contains?(x3, y3) ||
      platform.contains?(x4, y4)
    end
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
    @platform13.contains?(x2, y2) ||
    @platform14.contains?(x1, y1) ||
    @platform14.contains?(x2, y2) ||
    @platform15.contains?(x1, y1) ||
    @platform15.contains?(x2, y2) ||
    @platform16.contains?(x1, y1) ||
    @platform16.contains?(x2, y2) ||
    @platform17.contains?(x1, y1) ||
    @platform17.contains?(x2, y2) ||
    @platform18.contains?(x1, y1) ||
    @platform18.contains?(x2, y2) ||
    @platform19.contains?(x1, y1) ||
    @platform19.contains?(x2, y2)
  end
end
