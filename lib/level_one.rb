class LevelOne

  attr_reader :platforms

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

  def add_platforms
    @platforms.each do |platform|
      platform.add
    end
  end

end
