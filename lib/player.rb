class Player

  attr_accessor :direction, :jumper_state, :lives, :touching_platform, :current_floor, :y, :x, :x1, :x2, :x3, :x4, :y1, :y2, :y3, :y4, :platform_height, :reset, :coins, :player
  
  def initialize
    @jumper_state = 'grounded'
    @jump_height = 110
    @direction = nil
    @x = 40
    @y = Window.height - 80
    @platform_height = 0
    @reset = false
    @coins = 0
    @lives = 3
    @touching_platform = false
  end

  def draw
    @player = Square.new(x: @x, y: @y, size: 25, color: 'blue')
    @coin_counter = Text.new("Coins: #{@coins}", z: 4, x: 500)
    @lives_counter = Text.new("Lives: #{@lives}", z: 4, x: 500, y: 50)
    @x1 = @player.x1
    @x2 = @player.x2
    @x3 = @player.x3
    @x4 = @player.x4    
    @y1 = @player.y1
    @y2 = @player.y2
    @y3 = @player.y3
    @y4 = @player.y4
  end

  def reset
    if @reset
      @x = 40
      @y = Window.height - 40
      @reset = false
    end
  end

  def jump
    if @y < (@platform_height - @jump_height)
      @jumper_state = nil
      @platform_height = 0
    elsif @jumper_state == :jumping
      @y -= 15
    end
  end

  def touching_platform?
    if @platform_height == @y
      true
    end
  end

def checks_if_falling
  if touching_platform? == true
    @jumper_state = 'grounded'
  elsif @y > @platform_height
    @jumper_state = nil
  end
end

def fall_death
  if @y > Window.height
    lose_life
  end
end

def lose_life
  @reset = true
  @lives -= 1
end

def gravity
    @y += 7
end

end