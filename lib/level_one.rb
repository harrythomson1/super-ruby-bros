class LevelOne

  attr_reader :platforms, :coins, :enemies, :goal

  def initialize
    @platforms = [Rectangle.new(x: 0, y: Window.height - 10, color: 'green', height: 10, z: 3, width: Window.width),
      Rectangle.new(x: (Window.width - 200) / 2, y: Window.height - 85, color: 'green', height: 10, z: 3, width: 200),
      Rectangle.new(x: 0, y: Window.height - 165, color: 'green', height: 10, z: 3, width: 350),
      Rectangle.new(x: Window.width - 350, y: Window.height - 175, color: 'green', height: 10, z: 3, width: 350),
      Rectangle.new(x: (Window.width - 200) / 2, y: Window.height - 250, color: 'green', height: 10, z: 3, width: 200),
      Rectangle.new(x: 300, y: Window.height - 325, color: 'green', height: 10, z: 3, width: 100),
      Rectangle.new(x: 150, y: Window.height - 400, color: 'green', height: 10, z: 3, width: 100),
      Rectangle.new(x: 0, y: Window.height - 475, color: 'green', height: 10, z: 3, width: 100)]

    @images = []

    @coins = [Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 250, y: Window.height - 285, height: 40, width: 40, z:10),
      Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 200, y: Window.height - 285, height: 40, width: 40, z:10),
      Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 150, y: Window.height - 285, height: 40, width: 40, z:10)]

    @enemies = [Square.new(x: Window.width - 350, y: (Window.height - 174) - 15, size: 20, z:10)]

    @goal = Triangle.new(x1: 50, x2: 10, x3: 90, y1: Window.height - 525, y2: Window.height - 475, y3: Window.height - 475, color: 'fuchsia', z: 10)
    
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

    @enemies.each do |enemy|
      enemy.add
     end

    @goal.add
  end

  def coin_animation
    @coins.each do |coin|
      coin.play
    end
  end

  def check_enemy_0_boundary
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
