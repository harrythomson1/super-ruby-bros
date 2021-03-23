require 'ruby2d'

set title: "Super Ruby Bros", background: 'red'
FLOOR = 400
CEILING = 325
GRAVITY = 2
@jumper_state = "ready"

@square = Square.new(x: 40, y: FLOOR, size: 25, color: 'blue')

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
  elsif event.key == 'd'
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

update do
  @square.x += @x_speed
  @square.y += @y_speed

  tick += 1

  on :key do |event|
    if event.key == 'space' && @square.y > CEILING
      jump
    end
  end

  if @square.y < (CEILING)
    @y_speed = GRAVITY 
  end

  if @square.y == FLOOR
    @jumper_state = 'ready'
    @y_speed = 0
  end

end

show