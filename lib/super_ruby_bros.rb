require 'ruby2d'
require_relative 'player'
require_relative 'goal'
require_relative 'coin'
require_relative 'level_one'
require_relative 'enemy'

set title: "Super Ruby Bros", background: 'red'

@level_one = LevelOne.new
@goal = Goal.new
@coins = Coins.new
@player = Player.new
@enemies = Enemy.new

on :key_held do |event|
  if event.key == 'a'
    @player.x -= 4
  elsif event.key == 'd'
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

def collision_detected?
  if @level_one.collision(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.platform_height = @player.y
    @player.touching_platform = true
  else
    @player.touching_platform = false
    @player.y += 4
  end
end

def has_won?
  if @goal.collision(@player.x3, @player.y3, @player.x4, @player.y4)
    Text.new("Winner")
  end
end

def coin_collision?
  if @coins.collision_coin(@player.x1, @player.y1, @player.x2, @player.y2, @player.x3, @player.y3, @player.x4, @player.y4)
    @coins.move_coin
    @player.coins += 1
  end
end

def coin_collision2?
  if @coins.collision_coin2(@player.x1, @player.y1, @player.x2, @player.y2, @player.x3, @player.y3, @player.x4, @player.y4)
    @coins.move_coin2
    @player.coins += 1
  end
end

def coin_collision3?
  if @coins.collision_coin3(@player.x1, @player.y1, @player.x2, @player.y2, @player.x3, @player.y3, @player.x4, @player.y4)
    @coins.move_coin3
    @player.coins += 1
  end
end

def enemy_collision?
  if @enemies.collision_enemy(@player.x1, @player.y1, @player.x2, @player.y2, @player.x3, @player.y3, @player.x4, @player.y4)
    @player.reset = true
    @player.lives -= 1
  end
end

def game_over
  if @player.lives == 0
    Text.new("Gameover")
  end
end

update do
  clear
  if @player.lives > 0
    @level_one.draw
    @coins.draw
    @player.draw
    @goal.draw
    @enemies.draw
    @enemies.move_enemy_1
    @enemies.enemy_movement
    coin_collision?
    coin_collision2?
    coin_collision3?
    collision_detected?
    enemy_collision?
    has_won?
    @player.reset
    @player.jump
    @player.checks_if_falling
    @player.fall_death
  else
    game_over
  end
end

show