class LevelTwo

    attr_reader :platforms, :coins, :goal
  
    def initialize
      @platforms = [Rectangle.new(),
        Rectangle.new(x: 150, y: Window.height - 85, color: 'orange', height: 10, z: 4, width: 77),
        Rectangle.new(x: (Window.width - 190) / 2, y: Window.height - 425, color: 'blue', height: 10, z: 4, width:40),
        Rectangle.new(x: 0, y: Window.height - 550, color: 'purple', height: 10, z:4 , width: 77),
        Rectangle.new(x: (Window.width - 350), y: Window.height - 175, color: 'white', height: 10, z: 4, width: 77),
        Rectangle.new(x: 125, y: Window.height - 250, color: 'orange', height: 10, z: 4, width: 77),
        Rectangle.new(x: (Window.width - 625), y: Window.height - 150, color: 'red', height: 10, z: 4, width:40),
        Rectangle.new(x: 0, y: Window.height - 10, color: 'orange', height: 10, z:1 , width: 77),
        Rectangle.new(x: Window.width - 150, y: Window.height - 210, color: 'red', height: 10, z: 4, width: 77),
        Rectangle.new(x: (Window.width - 650), y: Window.height - 335, color: 'blue', height: 10, z: 4, width:40),
        Rectangle.new(x: (Window.width - 300), y: Window.height - 340, color: 'red', height: 10, z: 4, width:77),
        Rectangle.new(x: Window.width - 470, y: Window.height - 275, color: 'white', height: 10, z: 4, width: 40),
        Rectangle.new(x: 750, y: Window.height - 30 , color: 'orange', height: 10, z: 4, width: 77),
        Rectangle.new(x: 150, y: Window.height - 450, color: 'purple', height: 10, z: 4, width: 40),
        Rectangle.new(x: 650, y: Window.height - 50, color: 'orange', height: 10, z: 4, width:40)]
  
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
  