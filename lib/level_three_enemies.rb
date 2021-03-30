class LevelThreeEnemies
  
    def initialize
      @x1 = Window.width - 360
      @x_speed = 0
    end
  
    def draw
      @enemy = Square.new(x: @x1 + 10, y: (Window.height - 174) - 15, size: 20 )
    end
  
    def move_enemy_1
      if @x1 == Window.width - 14
        @x_speed = -2
      elsif @x1 == Window.width - 360
        @x_speed = 2
      end
    end
  
    def enemy_movement
      @x1 += @x_speed
    end
  
    def collision_enemy (x1, y1, x2, y2, x3, y3, x4, y4) 
      @enemy.contains?(x1, y1) ||
      @enemy.contains?(x2, y2) ||  
      @enemy.contains?(x3, y3) ||
      @enemy.contains?(x4, y4)
    end
  
  end