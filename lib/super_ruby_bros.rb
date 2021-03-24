require 'ruby2d'
require_relative 'player'
require_relative 'platform'

set title: "Super Ruby Bros", background: 'red'

# floor = 400
# CEILING = 325
# GRAVITY = 4
# @jumper_state = "ready"

obstacle = 1000

@player = Player.new
@platform = Platform.new(100, 380)

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
    @player.current_floor = @platform.y - (@platform.height / 2)
  else
    @player.current_floor = 400
  end
end

update do
  clear
  @player.draw
  @platform.draw
  collision_detected_left?
  collision_detected_right?
  collision_detected_top?
  @player.gravity
  @player.jump
  @player.checks_if_grounded
  puts "current floor: #{@player.current_floor}"
  puts "player Y: #{@player.y}"
  puts "jumper state: #{@player.jumper_state}"

end

# @platform = Rectangle.new(x: 200, y: 380, width: 200, height: 50, color: 'green')

# @x_speed = 0
# @y_speed = 0


# tick = 0

# def jump
#   if @jumper_state == "ready"
#     @y_speed = -10
#     @jumper_state = 'jumping'
#   end 
# end

# on :key_held do |event|
#   if event.key == 'a' && wall_collission_right_detection != true
#     @square.x -= 2
#   elsif event.key == 'd' && wall_collission_left_detection != true
#     @square.x += 2
#   end
# end

# def wall_collission_right_detected?
#   @platform.contains?(@square.x1, @square.y1)
# end

# def wall_collission_left_detected?
#   @platform.contains?(@square.x2, @square.y2)
# end

# def floor_collission_detected?
#   @platform.contains?(@square.x3, @square.y3) ||
#   @platform.contains?(@square.x4, @square.y4)
# end

# def floor_collission_detection
#   if floor_collission_detected?
#     @square.y = @platform.y - 27
#     @jumper_state = "ready"
#     true
#   end
# end


# def wall_collission_right_detection
#   if wall_collission_right_detected?
#     true
#   end
# end

# def wall_collission_left_detection
#   if wall_collission_left_detected?
#     true
#   end
# end


# update do
#   wall_collission_left_detection
#   wall_collission_right_detection
#   floor_collission_detection
#   @square.x += @x_speed
#   @square.y += @y_speed
#   tick += 1

#   puts @jumper_state
#   puts @square.y
#   on :key do |event|
#     if event.key == 'space'
#       jump
#     end
#   end

#   if @square.y < CEILING
#     @y_speed = GRAVITY 
#   end

#   if @square.y >= floor
#     @jumper_state = 'ready'
#     @y_speed = 0
#   end

# end

show