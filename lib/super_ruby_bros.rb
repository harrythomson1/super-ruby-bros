require 'ruby2d'
require_relative 'player'
require_relative 'platform'

set title: "Super Ruby Bros", background: 'red'

@player = Player.new
@platform = Platform.new(x: 250, y: 360, height: 25, width: 200, color: 'green')
@platform2 = Platform.new(x: 0, y: 427, height: 25, width: 200, color: 'green')


on :key_held do |event|
  if event.key == 'a' && collision_detected_right? != true 
    @player.x -= 4
  elsif event.key == 'd' && collision_detected_left? != true
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

def collision_detected_left?
  if @platform.collision_left(@player.x2, @player.y2)
    true
  end
end

def collision_detected_right?
  if @platform.collision_right(@player.x1, @player.y1)
    true
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

update do
  clear
  @player.draw
  @platform.draw
  @platform2.draw
  collision_detected_left?
  collision_detected_right?
  collision_detected_top?
  collision_detected_top2?
  @player.reset
  @player.jump
  @player.checks_if_falling
  puts "current floor: #{@player.current_floor}"
  puts "player Y: #{@player.y}"
  puts "jumper state: #{@player.jumper_state}"

end

show