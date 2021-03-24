class Player

  attr_accessor :direction, :jumper_state, :current_floor, :y, :x
  
  def initialize
    @jumper_state = 'grounded'
    @jump_height = 75
    @direction = nil
    @x = 40
    @y = 400
    @current_floor = 400
  end

  def draw
    Square.new(x: @x, y: @y, size: 25, color: 'blue')
  end

  def move(right: 100, left: 10)
    if @direction == :right && @x < right
      @x += 2
    elsif @direction == :left && @x > left
      @x -= 2
    end
  end

  def jump
    if @jumper_state == :jumping && @y < (@current_floor - @jump_height)
      @jumper_state = nil
    elsif @jumper_state == :jumping && @y > (@current_floor - @jump_height)
      @y -= 10
    end
    puts "jumpheight #{@current_floor - @jump_height}"
  end

  def gravity
    if @jumper_state == nil && @y < @current_floor
      @y += 4
    end
  end

  def checks_if_grounded
    if @y >= @current_floor 
      @jumper_state = 'grounded'
    end
  end

end