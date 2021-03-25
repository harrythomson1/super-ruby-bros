class Player

  attr_accessor :direction, :jumper_state, :current_floor, :y, :x, :x1, :x2, :x3, :x4, :y1, :y2, :y3, :y4, :platform_height
  
  def initialize
    @jumper_state = 'grounded'
    @jump_height = 75
    @direction = nil
    @x = 40
    @y = 400
    @current_floor = 400
    @platform_height = 400
  end

  def draw
    @player = Square.new(x: @x, y: @y, size: 25, color: 'blue')
    @x1 = @player.x1
    @x2 = @player.x2
    @x3 = @player.x3
    @x4 = @player.x4
    @y1 = @player.y1
    @y2 = @player.y2
    @y3 = @player.y3
    @y4 = @player.y4
  end

  def jump
    if @y < (@platform_height - @jump_height)
      @jumper_state = nil
    elsif @jumper_state == :jumping
      @y -= 12
    end
    puts "jumpheight #{@platform_height - @jump_height}"
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