class Player

  attr_accessor :direction, :jumper_state, :lives, :touching_platform, :current_floor, :y, :x, :x1, :x2, :x3, :x4, :y1, :y2, :y3, :y4, :platform_height, :reset, :coins
  
  def initialize
    @jumper_state = 'grounded'
    @jump_height = 125
    @direction = nil
    @x = 40
    @y = Window.height - 40
    @platform_height = 0
    @reset = false
    @coins = 0
    @lives = 3
    @touching_platform = true
  end

  def draw
    @player = Square.new(x: @x, y: @y, size: 30, color: 'blue', z:0)
    @coin_counter = Text.new("Coins: #{@coins}", z: 4, x: 750,color: 'black')
    @lives_counter = Text.new("Lives: #{@lives}", z: 4, x: 750, y:40, color: 'black')
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
    elsif @jumper_state == :jumping
      @y -= 15
    end
  end

def checks_if_falling
  if @platform_height == @y && @touching_platform == true
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

end