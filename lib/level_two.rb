class LevelTwo

    attr_reader :platforms, :coins, :goal
  
    def initialize
      @platforms = [ Rectangle.new(x: 150, y: Window.height - 85, color: 'orange', height: 10, z:6 , width: 77),
        Rectangle.new(x: (Window.width - 190) / 2, y: Window.height - 425, color: 'blue', height: 10, z:6 , width:40),
        Rectangle.new(x: 0, y: Window.height - 500, color: 'purple', height: 10, z:0, width: 77),
        Rectangle.new(x: (Window.width - 350), y: Window.height - 175, color: 'white', height: 10, z:6 , width: 77),
        Rectangle.new(x: 125, y: Window.height - 250, color: 'orange', height: 10, z:6 , width: 77),
        Rectangle.new(x: (Window.width - 625), y: Window.height - 150, color: 'red', height: 10, z:6 , width:40),
        Rectangle.new(x: 0, y: Window.height - 10, color: 'orange', height: 10, z:1 , width: 77),
        Rectangle.new(x: Window.width - 150, y: Window.height - 210, color: 'red', height: 10, z:6 , width: 77),
        Rectangle.new(x: (Window.width - 650), y: Window.height - 335, color: 'blue', height: 10, z:6 , width:40),
        Rectangle.new(x: (Window.width - 300), y: Window.height - 340, color: 'red', height: 10, z:6 , width:77),
        Rectangle.new(x: Window.width - 470, y: Window.height - 275, color: 'white', height: 10, z:6 , width: 40),
        Rectangle.new(x: 750, y: Window.height - 30 , color: 'orange', height: 10, z:6 , width: 77),
        Rectangle.new(x: 150, y: Window.height - 420, color: 'purple', height: 10, z:6 , width: 40),
        Rectangle.new(x: 650, y: Window.height - 100, color: 'green', height: 10, z:6 , width:40)]
        
      @images = [Image.new('./assets/wood.png', z: 4, x: 0, y: Window.height - 500),
      Image.new('./assets/wood.png', z: 4, x: Window.width - 350, y: Window.height - 175),
      Image.new('./assets/wood.png', z: 4,x: 125, y: Window.height - 250),
      Image.new('./assets/wood.png', z: 4, x: (Window.width - 625), y: Window.height - 150),
      Image.new('./assets/wood.png', z: 4, x: 0, y: Window.height - 10),
      Image.new('./assets/wood.png', z: 4, x: Window.width - 150, y: Window.height - 210),
      Image.new('./assets/wood.png', z: 4, x: (Window.width - 650), y: Window.height - 335),
      Image.new('./assets/wood.png', z: 4, x: (Window.width - 300), y: Window.height - 340),
      Image.new('./assets/wood.png', z: 4, x: 150, y: Window.height - 85),
      Image.new('./assets/wood.png', z: 4, x: (Window.width - 190) / 2, y: Window.height - 425),
      Image.new('./assets/wood.png', z: 4, x: Window.width - 470, y: Window.height - 275),
      Image.new('./assets/wood.png', z: 4, x: 750, y: Window.height - 30 )]
      
      @coins = [Square.new(x: Window.width - 250, y: Window.height - 285, size: 25, color: 'yellow', z: 5),
        Square.new(x: Window.width - 200, y: Window.height - 285, size: 25, color: 'yellow', z: 5),
        Square.new(x: Window.width - 150, y: Window.height - 285, size: 25, color: 'yellow', z: 5)]
  
      @goal = Triangle.new(x1: 40, x2: 10, x3: 70, y1: Window.height - 550, y2: Window.height - 500, y3: Window.height - 500, color: 'fuchsia', z: 6)
      
      @enemy_speed = 0
    end
  
    def add_assets
      @platforms.each do |platform|
        platform.add
      end

      @coins.each do |coin|
        coin.add
      end

      @images.each do |image|
        image.add
      end

      @goal.add
    end
  
  
  end
  