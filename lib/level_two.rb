class LevelTwo

    attr_reader :platforms, :coins, :goal
  
    def initialize
      @platforms = [Rectangle.new(x: 0, y: Window.height - 10, color: 'green', height: 10, z: 3, width: Window.width),
        Rectangle.new(x: (Window.width - 200) / 2, y: Window.height - 85, color: 'green', height: 10, z: 3, width: 200),
        Rectangle.new(x: 0, y: Window.height - 165, color: 'green', height: 10, z: 3, width: 350),
        Rectangle.new(x: Window.width - 350, y: Window.height - 175, color: 'green', height: 10, z: 3, width: 350),
        Rectangle.new(x: (Window.width - 200) / 2, y: Window.height - 250, color: 'green', height: 10, z: 3, width: 200),
        Rectangle.new(x: 300, y: Window.height - 325, color: 'green', height: 10, z: 3, width: 100),
        Rectangle.new(x: 150, y: Window.height - 400, color: 'green', height: 10, z: 3, width: 100),
        Rectangle.new(x: 0, y: Window.height - 475, color: 'green', height: 10, z: 3, width: 100)]
  
      @coins = [Square.new(x: Window.width - 250, y: Window.height - 285, size: 25, color: 'yellow'),
        Square.new(x: Window.width - 200, y: Window.height - 285, size: 25, color: 'yellow'),
        Square.new(x: Window.width - 150, y: Window.height - 285, size: 25, color: 'yellow')]
  
      @goal = Triangle.new(x1: 50, x2: 10, x3: 90, y1: Window.height - 525, y2: Window.height - 475, y3: Window.height - 475, color: 'fuchsia', z: 1)
      
      @enemy_speed = 0
    end
  
    def add_platforms
      @platforms.each do |platform|
        platform.add
      end
    end
  
    def add_coins
      @coins.each do |coin|
        coin.add
      end
    end
  
  
    def add_goal
      @goal.add
    end
  
  
  end
  