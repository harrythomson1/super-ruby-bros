class LevelTwoEnemies


  def initialize
    @x1 = 200
    @x1_speed = 0
    @y2 = (Window.height - 270)
    @y2_speed = 0
    @y3 = (Window.height - 420)
    @y3_speed = 0
  end

  def draw
    @enemy1 = Square.new(x: @x1, y: (Window.height - 25), size: 20 )
    @enemy2 = Square.new(x: 490, y: @y2, size: 20)
    @enemy3 = Square.new(x: 115, y: @y3, size: 20)
  end

  def move_enemy_1
    if @x1 == 430
      @x1_speed = -2
    elsif @x1 == 200
      @x1_speed = 2
    end
  end

  def move_enemy_2
    if @y2 == Window.height - 270
      @y2_speed = 4
    elsif @y2 == Window.height - 110
      @y2_speed = -4
    end
  end

  def move_enemy_3
    if @y3 == Window.height - 420
      @y3_speed = 2
    elsif @y3 == Window.height - 250
      @y3_speed = -2
    end
  end

  # 13 + 14

  def enemy_movement
    @x1 += @x1_speed
    @y2 += @y2_speed
    @y3 += @y3_speed
  end

  def collision_enemy(x1, y1, x2, y2, x3, y3, x4, y4)
    @enemy1.contains?(x1, y1) ||
    @enemy1.contains?(x2, y2) ||
    @enemy1.contains?(x3, y3) ||
    @enemy1.contains?(x4, y4) ||
    @enemy2.contains?(x1, y1) ||
    @enemy2.contains?(x2, y2) ||
    @enemy2.contains?(x3, y3) ||
    @enemy2.contains?(x4, y4) ||
    @enemy3.contains?(x1, y1) ||
    @enemy3.contains?(x2, y2) ||
    @enemy3.contains?(x3, y3) ||
    @enemy3.contains?(x4, y4)

  end
end
