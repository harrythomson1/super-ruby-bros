require 'ruby2d'

set title: "Super Ruby Bros", background: 'red'
floor = 400
CEILING = 325
GRAVITY = 4
@jumper_state = "ready"

@square = Square.new(x: 40, y: floor, size: 25, color: 'blue')
@platform = Rectangle.new(x: 200, y: 380, width: 200, height: 50, color: 'green')

@x_speed = 0
@y_speed = 0


tick = 0

def jump
  if @jumper_state == "ready"
    @y_speed = -10
    @jumper_state = 'jumping'
  end 
end

on :key do |event|
  if event.key == 'a'
    @x_speed = -2
  elsif event.key == 'd' && colissions_detection != true
    @x_speed = 2
  end
end

on :key_up do |event|
  if event.key == 'a'
    @x_speed = 0
  elsif event.key == 'd'
    @x_speed = 0
  end
end

def colission_detected?
  @platform.contains?(@square.x1, @square.y1) ||
  @platform.contains?(@square.x2, @square.y2) ||
  @platform.contains?(@square.x3, @square.y3) ||
  @platform.contains?(@square.x4, @square.y4)
end

def colissions_detection
  if colission_detected?
    @jumper_state = "ready"
    @y_speed = 0
    true
  end
end


update do
  colissions_detection
  @square.x += @x_speed
  @square.y += @y_speed
  tick += 1

  on :key do |event|
    if event.key == 'space' && @square.y > CEILING
      jump
    end
  end

  if @square.y < CEILING
    @y_speed = GRAVITY 
  end

  if @square.y == floor
    @jumper_state = 'ready'
    @y_speed = 0
  end

end

show