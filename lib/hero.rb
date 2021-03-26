class Hero 
  attr_accessor :z, :y, :x, :clip_width, :width, :height, :direction, :jumper_state, :current_floor, :platform_height, :reset
  
  def initialize
    @jumper_state = 'grounded'
    @jump_height = 75
    @direction = nil
    @x = 40
    @y = 350
    @z = 3
    @current_floor = 350
    @platform_height = 350
    @reset = false
  end

  
  def dog
    Sprite.new(
    './assets/hero.png',  
    width: 33,
    height: 84,
    clip_width: 33,
    y: @y,
    x: @x,
    z: @z
   )
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
