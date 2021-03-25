require 'ruby2d'
require_relative 'player'
require_relative 'platform'

set title: "Super Ruby Bros", background: 'red'

@player = Player.new
@platform = Platform.new(250, 360)

on :key_held do |event|
  if event.key == 'a' && collision_detected_right? != true 
    @player.x -= 4
  elsif event.key == 'd' && collision_detected_left? != true
    @player.x += 4
  elsif event.key == 'space' && @player.jumper_state == 'grounded'
    @player.jumper_state = :jumping
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
    # @player.current_floor = @platform.y - (@platform.height)
    @player.jumper_state = 'grounded'
  elsif @player.y <= 400 
    @player.y += 4
  end
end

update do
  clear
  @player.draw
  @platform.draw
  collision_detected_left?
  collision_detected_right?
  collision_detected_top?
  # @player.gravity
  @player.jump
  @player.checks_if_grounded
  puts "current floor: #{@player.current_floor}"
  puts "player Y: #{@player.y}"
  puts "jumper state: #{@player.jumper_state}"

end

show