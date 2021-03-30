class Player

  attr_reader :square, :lives
  attr_writer :reset
  attr_accessor :jumper_state, :touching_platform, :y, :x, :platform_height, :coins, :player



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
    @square = Square.new(x: @x, y: @y, size: 25, color: 'blue')
    @coin_counter = Text.new("Coins: #{@coins}", z: 4, x: 500)
    @lives_counter = Text.new("Lives: #{@lives}", z: 4, x: 500, y: 50)
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