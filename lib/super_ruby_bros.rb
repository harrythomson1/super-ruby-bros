require 'ruby2d'

set title: "Super Ruby Bros", background: 'red'
FLOOR = 400

@square = Square.new(x: 40, y: FLOOR, size: 25, color: 'blue')

@x_speed = 0
@y_speed = 0


tick = 0

def jump
  @square.y += -5
end

on :key do |event|
  if event.key == 'a'
    @x_speed = -2
    @y_speed = 0
  elsif event.key == 'd'
    @x_speed = 2
    @y_speed = 0
  # elsif event.key == 'j'
  #   if @square.y == FLOOR
  #     @square.y -= 75
  #     p @square.y
  #   end
  end
end

on :key_up do |event|
  if event.key == 'a'
    @x_speed = 0
    @y_speed = 0
  elsif event.key == 'd'
    @x_speed = 0
    @y_speed = 0
  end
end

update do
  @square.x += @x_speed
  @square.y += @y_speed

  if tick % 2 == 0 && @square.y < FLOOR
    @square.y += 5
  end

  tick += 1

  on :key do |event|
    if event.key == 'j' && @square.y > 325
      @square.y -= 0.03
    end
  end

end

show