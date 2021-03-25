require 'ruby2d'

set title: "Super Ruby Bros", width: 960, height: 480

FLOOR = 575
CEILING = 375
SPEED = 3.25

background = Image.new('./assets/background (1).png')

@hero = Sprite.new(
  './assets/wPitbullsprite.png',  
  width: 33,
  height: 84,
  clip_width: 33,
  y: 350
)

def jump
  @hero.y -= 75
end

on :key_held  do |event|
  case event.key 
    when 'a'
      @hero.play 
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



update do
  wall_collission_left_detection
  wall_collission_right_detection
  floor_collission_detection
  @square.x += @x_speed
  @square.y += @y_speed
  tick += 1


  on :key do |event|
    if event.key == 'space'
      jump
    end
  end

  if @hero.y < CEILING
    @y_speed = GRAVITY 
  end

  if @hero.y >= floor
    @jumper_state = 'ready'
    @y_speed = 0
  end

show