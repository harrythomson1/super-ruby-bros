class LevelThree

  attr_reader :platforms, :enemies

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
    @enemies = [Square.new(x: 200, y: Window.height - 25, size: 20),
      Square.new(x: 490, y: Window.height - 270, size: 20),
      Square.new(x: 115, y: Window.height - 450, size: 20)]
    @enemy_0_speed = 0
    @enemy_1_speed = 0
    @enemy_2_speed = 0

  end

  def add_platforms
    @platforms.each do |platform|
      platform.add
    end
  end

  def add_enemies
    @enemies.each do |enemy|
      enemy.add
    end
  end

  def check_enemy_0_boundary
    if @enemies[0].x == 430
      @enemy_0_speed = -2
    elsif @enemies[0].x == 200
      @enemy_0_speed = 2
    end
  end

  def check_enemy_1_boundary
    if @enemies[1].y == Window.height - 270
      @enemy_1_speed = 4
    elsif @enemies[1].y == Window.height - 110
      @enemy_1_speed = -4
    end
  end

  def check_enemy_2_boundary
    if @enemies[2].y == Window.height - 450
      @enemy_2_speed = 4
    elsif @enemies[2].y == Window.height - 250
      @enemy_2_speed = -4
    end
  end

  def enemy_movement
    @enemies[0].x += @enemy_0_speed
    @enemies[1].y += @enemy_1_speed
    @enemies[2].y += @enemy_2_speed
  end

end
