class Player

  attr_accessor :direction, :jumper_state, :current_floor, :y, :x, :x1, :x2, :x3, :x4, :y1, :y2, :y3, :y4, :platform_height, :reset, :coins
  
  def initialize
    @jumper_state = 'grounded'
    @jump_height = 75
    @direction = nil
    @x = 40
    @y = 400
    @current_floor = 400
    @platform_height = 400
    @reset = false
    @coins = 0
  end

  def draw
    @player = Square.new(x: @x, y: @y, size: 25, color: 'blue')
    @coin_counter = Text.new("Coins: #{@coins}", z: 4, x: 500)
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
      @y = 405
      @reset = false
    end
  end

  def jump
    if @y < (@platform_height - @jump_height)
      @jumper_state = nil
    elsif @jumper_state == :jumping
      @y -= 12
    end
  end

def grounded
  if @platform_height == @y
    @jumper_state = 'grounded'
  end
end

end