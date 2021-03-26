require 'ruby2d'
require_relative 'player'
require_relative 'platform'
require_relative 'goal'


set title: "Super Ruby Bros"

@goal = Goal.new
@platform = Platform.new(x: 0, y: 430, height: 25, width: 200, color: 'white', z: 1)
@platform2 = Platform.new(x: 250, y: 360, height: 25, width: 100, color: 'white', z: 1)
@platform3 = Platform.new(x: 430, y: 300, height: 25, width: 250, color: 'white', z: 1)
@platform4 = Platform.new(x: 250, y: 250, height: 25, width: 100, color: 'white', z: 1)
@platform5 = Platform.new(x: 0, y: 190, height: 25, width: 200, color: 'white', z: 1)
@player = Player.new





on :key_held do |event|
  if event.key == 'a'
    @player.x -= 4
  elsif event.key == 'd'
    @player.x += 4
  elsif event.key == 'space' && @player.jumper_state == 'grounded'
    @player.jumper_state = :jumping
  elsif event.key == 'r'
    @player.reset = true
  end
end

on :key_up do |event|
  @player.direction = nil
  if event.key == 'space'
    @player.jumper_state = nil
  end
end

def collision_detected_top?
  if @platform.collision_top(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.jumper_state = 'grounded'
    @player.y = @platform.y - (@platform.height + 0.01)
    @player.platform_height = @platform.y - @platform.height
  elsif
    @player.y += 4
  end
end

def collision_detected_top2?
  if @platform2.collision_top(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.jumper_state = 'grounded'
    @player.y = @platform2.y - (@platform2.height + 0.01)
    @player.platform_height = @platform2.y - @platform2.height
  end
end

def collision_detected_top3?
  if @platform3.collision_top(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.jumper_state = 'grounded'
    @player.y = @platform3.y - (@platform3.height + 0.01)
    @player.platform_height = @platform3.y - @platform3.height
  end
end



def collision_detected_top4?
  if @platform4.collision_top(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.jumper_state = 'grounded'
    @player.y = @platform4.y - (@platform4.height + 0.01)
    @player.platform_height = @platform4.y - @platform4.height
  end
end

def collision_detected_top5?
  if @platform5.collision_top(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.jumper_state = 'grounded'
    @player.y = @platform5.y - (@platform5.height + 0.01)
    @player.platform_height = @platform5.y - @platform5.height
  end
end

def has_won?
  if @goal.collision(@player.x3, @player.y3, @player.x4, @player.y4)
    Text.new("Winner", z:3)
  end
end

update do
  clear
  background = Image.new('../assets/background (1).png', z: 2)
  box_1 = Image.new('../assets/00.png',z: 2, x: 0, y: 430, height: 25, width: 200, )
  box_2 = Image.new('../assets/00.png',z: 2, x: 250, y: 360, height: 25, width: 100, )
  box_3 = Image.new('../assets/00.png',z: 2, x: 430, y: 300, height: 25, width: 250 )
  box_4 = Image.new('../assets/00.png',z: 2, x: 250, y: 250, height: 25, width: 100 )
  box_5 = Image.new('../assets/00.png',z: 2, x: 0, y: 190, height: 25, width: 200 )
  @hero_img = Image.new('../assets/hero_1_png.png',z: 2)
  @player.draw
  @platform.draw
  @platform2.draw
  @platform3.draw
  @platform4.draw
  @platform5.draw
  @goal.draw
  collision_detected_top?
  collision_detected_top2?
  collision_detected_top3?
  collision_detected_top4?
  collision_detected_top5?
  has_won?
  @player.reset
  @player.jump
  @player.checks_if_falling
  @hero_img.x = @player.x - 5
  @hero_img.y = @player.y - 35
  if @player.jumper_state == 'grounded'
    @player.jumper_state = :jumping
  end


  # puts "current floor: #{@player.current_floor}"
  # puts "jumper state: #{@player.jumper_state}"

end

show