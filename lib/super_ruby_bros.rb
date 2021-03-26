require 'ruby2d'
require_relative 'player'
require_relative 'platform'
require_relative 'goal'
require_relative 'coin'
require_relative 'new_platform'

set title: "Super Ruby Bros", background: 'red'

@level_one = LevelOne.new
@goal = Goal.new
@coin2 = Coin.new(x: 470, y: 240)
@coin = Coin.new(x: 60, y: 360)
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

def collision_detected?
  if @level_one.collision(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.platform_height = @player.y
  else
    @player.y += 4
  end
end

def has_won?
  if @goal.collision(@player.x3, @player.y3, @player.x4, @player.y4)
    Text.new("Winner")
  end
end

def coin_collision2?
  if @coin2.collision(@player.x1, @player.y1, @player.x2, @player.y2, @player.x3, @player.y3, @player.x4, @player.y4)
    @coin2.y = 1000
    @player.coins += 1
    puts "1"
  end
end

def coin_collision?
  if @coin.collision(@player.x1, @player.y1, @player.x2, @player.y2, @player.x3, @player.y3, @player.x4, @player.y4)
    @coin.y = 1000
    @player.coins += 1
    puts "2"
  end
end

update do
  clear
  @level_one.draw
  @player.draw
  collision_detected?
  puts "platform height #{@player.platform_height}"
  puts "player y #{@player.y}"
  puts "jumper_state #{@player.jumper_state}"

  @player.reset
  @player.jump
  @player.grounded
end

show