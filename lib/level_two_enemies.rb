class LevelTwoEnemies

  def initialize
    @x1 = 200
    @x1_speed = 0
  end

  def draw
    @enemy1 = Square.new(x: @x1, y: (Window.height - 25), size: 20 )
  end

  def move_enemy_1
    if @x1 == 450
      x1_speed = -2
    elsif @x1 == 200
      x1_speed = 2
  end
end
