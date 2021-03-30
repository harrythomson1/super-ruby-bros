class LevelOne

  attr_reader :platforms, :coins

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
    @enemies = [Square.new(x: Window.width - 350, y: (Window.height - 174) - 15, size: 20 )]
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

  def add_enemies
    @enemies.each do |enemy|
     enemy.add
    end
  end

  def check_enemy_1_boundary
    if @enemies[0].x == Window.width - 14
      @enemy_speed = -2
    elsif @enemies[0].x == Window.width - 350
      @enemy_speed = 2
    end
  end

  def enemy_movement
    @enemies[0].x += @enemy_speed
  end

end
