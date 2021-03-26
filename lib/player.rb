class Player

  attr_accessor :direction, :jumper_state, :current_floor, :y, :x, :x3, :x4, :y3, :y4, :platform_height, :reset
  
  def initialize
    @jumper_state = 'grounded'
    @jump_height = 75
    @direction = nil
    @x = 40
    @y = 400
    @current_floor = 400
    @platform_height = 400
    @reset = false
  end


  
  def draw
    @player = Square.new(x: @x, y: @y, size: 25, color: 'red', z:0)
    @x3 = @player.x3
    @x4 = @player.x4
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

  # def gravity
  #   if @jumper_state != 'jumping' && @y < @current_floor 
  #     @y += 4
  #   end
  # end

  def checks_if_falling
    if @y > @platform_height
      @jumper_state = nil
    end
  end

end