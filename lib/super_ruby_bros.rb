require 'ruby2d'
require_relative 'player'
require_relative 'goal'
require_relative 'coin'
require_relative 'enemy'
require_relative 'level_one'
require_relative 'level_two'


set title: "Super Ruby Bros", background: 'red', width: 900, height: 700

@level_one = LevelOne.new
@level_two = LevelTwo.new
@goal = Goal.new
@coins = Coins.new
@player = Player.new
@enemies = Enemy.new

level_two = true

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

def level_one_collision_detected?
  if @level_one.collision(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.platform_height = @player.y
    @player.touching_platform = true
  else
    @player.touching_platform = false
    @player.y += 4
  end
end

def level_one_collision_detected_bottom?
  if @level_one.collision_bottom(@player.x1, @player.y1, @player.x2, @player.y2)
    @player.jumper_state = nil
  end
end

def level_two_collision_detected?
  if @level_two.collision(@player.x3, @player.y3, @player.x4, @player.y4)
    @player.platform_height = @player.y
    @player.touching_platform = true
  else
    @player.touching_platform = false
    @player.y += 4
  end
end

def level_two_collision_detected_bottom?
  if @level_two.collision_bottom(@player.x1, @player.y1, @player.x2, @player.y2)
    @player.jumper_state = nil
  end
end

def has_won?
  if @goal.collision(@player.x1, @player.y1, @player.x2, @player.y2, @player.x3, @player.y3, @player.x4, @player.y4)
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
    @player.lose_life
  end
end

def game_over
  if @player.lives == 0
    Text.new("Gameover")
  end
end

def player_methods
  @player.reset
  @player.jump
  @player.checks_if_falling
  @player.fall_death
end

update do
  clear
  if @player.lives > 0 && level_two == false
    @level_one.draw
    @coins.draw
    @goal.draw
    @enemies.draw
    @player.draw
    enemy_collision?
    @enemies.move_enemy_1
    @enemies.enemy_movement
    coin_collision?
    coin_collision2?
    coin_collision3?
    level_one_collision_detected?
    level_one_collision_detected_bottom?
    has_won?
    player_methods
  elsif level_two == true
    @level_two.draw
    @player.draw
    level_two_collision_detected?
    level_two_collision_detected_bottom?
    player_methods
  else
    game_over
  end
end

show