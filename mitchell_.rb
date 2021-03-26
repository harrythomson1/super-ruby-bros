require 'ruby2d'

set title: "Super Ruby Bros", width: 960, height: 480

FLOOR = 350
CEILING = 250
SPEED = 3.25
GRAVITY  = 10
@jumper_state = "ready"
PLANE_SPEED = 2


@platform = Rectangle.new(x: 200, y: 380, width: 200, height: 50, color: 'green', z:2)
background = Image.new('./assets/background (1).png',z:1)
@x_speed = 0
@y_speed = 0 


@plane = Sprite.new(
    './assets/plane.png',  
  width: 50,
  height: 40,
  clip_width: 100,
  y: 100,
  z: 3,
  x: 890
)

@hero = Sprite.new(
  './assets/hero.png',  
  width: 33,
  height: 84,
  clip_width: 33,
  y: 350,
  z: 3
)


tick = 0


def jump
  if @jumper_state == "ready"
    @y_speed = -10
    @jumper_state = 'jumping'
  end 
end

on :key_held  do |event|
  case event.key 
    when 'a'
      @hero.play flip: :horizontal 
      if @hero.x > 0
        @hero.x -= SPEED 
      end
    when 'd'
      @hero.play 
      if @hero.x <(Window.width - @hero.width)
        @hero.x += SPEED
      end 
  end 
end 

on :key_up do 
    @hero.stop
end

def hit?(a,b) 
  a.contains?(b.x, b.y)
end 

update do

  if hit?(@hero,@platform)
    @hero.stop
  else
  end


  @plane.play flip: :horizontal 

  if @plane.x <(Window.width - @plane.width)
    @plane.x -= PLANE_SPEED
  elsif @plane.x > 0
    @plane.x += PLANE_SPEED
  end
  puts @hero.x
  puts @hero.y
  puts @platform.x
  puts @platform.y  
  @hero.x += @x_speed
  @hero.y += @y_speed


  on :key do |event|
    if event.key == 'space'
      jump
    end
  end

  if @hero.y < CEILING
    @y_speed = GRAVITY 
  end

  if @hero.y >= FLOOR
    @jumper_state = 'ready'
    @y_speed = 0
  end
end 
show