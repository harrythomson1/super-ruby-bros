require 'ruby2d'

set title: "Super Ruby Bros", background: 'red'

@square = Square.new(x: 40, y: 70, size: 25, color: 'blue')

@x_speed = 0
@y_speed = 0

on :key do |event|
  if event.key == 'a'
    @x_speed = -2
    @y_speed = 0
  elsif event.key == 'd'
    @x_speed = 2
    @y_speed = 0
  elsif event.key == 'w'
    @x_speed = 0
    @y_speed = -2
  elsif event.key == 's'
    @x_speed = 0
    @y_speed = 2
  end
end

on :key_up do |event|
  if event.key == 'a'
    @x_speed = 0
    @y_speed = 0
  elsif event.key == 'd'
    @x_speed = 0
    @y_speed = 0
  elsif event.key == 'w'
    @x_speed = 0
    @y_speed = 0
  elsif event.key == 's'
    @x_speed = 0
    @y_speed = 0
  end
end

update do
  @square.x += @x_speed
  @square.y += @y_speed
end

show