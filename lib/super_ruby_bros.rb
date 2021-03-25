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

@hero_rec = Rectangle.new(y:FLOOR, width: 33, height: 84, color: 'white', z:0)


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
        @hero_rec.x -= SPEED
      end
    when 'd'
      @hero.play 
      if @hero.x <(Window.width - @hero.width)
        @hero.x += SPEED
        @hero_rec.x += SPEED
      end 
  end 
end 


def wall_collission_right_detected?
  @platform.contains?(@hero_rec.x1, @hero_rec.y1)
end

def wall_collission_left_detected?
  @platform.contains?(@hero_rec.x2, @hero_rec.y2)
end

def floor_collission_detected?
  @platform.contains?(@hero_rec.x3, @hero_rec.y3) ||
  @platform.contains?(@hero_rec.x4, @hero_rec.y4)
end


def wall_collission_right_detection
  if wall_collission_right_detected?
    true
  end
end

def wall_collission_left_detection
  if wall_collission_left_detected?
    true
  end
end


on :key_up do 
    @hero.stop
end

update do
  @plane.play flip: :horizontal 

  if @plane.x <(Window.width - @plane.width)
    @plane.x -= PLANE_SPEED
  elsif @plane.x > 0
    @plane.x += PLANE_SPEED
  end
  wall_collission_left_detection
  wall_collission_right_detection
  @hero.x += @x_speed
  @hero.y += @y_speed
  @hero_rec.x += @x_speed
  @hero_rec.y += @y_speed



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