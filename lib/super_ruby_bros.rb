require 'ruby2d'
require_relative 'player'
require_relative 'level_two_enemies'
require_relative 'level_one'
require_relative 'level_two'


set title: "Super Ruby Bros", background: 'red', width: 900, height: 700

GRAVITY = 7

@level_one = LevelOne.new
@level_two = LevelTwo.new
@player = Player.new
@level_two_enemies = LevelTwoEnemies.new

@stage_one = true
@stage_two = false

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

def level_one_platform_collision
  @level_one.platforms.each do |platform|
    if platform.contains?(@player.x3, @player.y3) || platform.contains?(@player.x4, @player.y4)
      @player.platform_height = @player.y
      @player.y -= 7
      @player.touching_platform = true
    elsif platform.contains?(@player.x1, @player.y1) || platform.contains?(@player.x2, @player.y2)
      @player.jumper_state = nil
    end
  end
end

def level_one_coin_collision
  @level_one.coins.each do |coin|
    if coin.contains?(@player.x1, @player.y1) || coin.contains?(@player.x2, @player.y2) || coin.contains?(@player.x3, @player.y3) || coin.contains?(@player.x4, @player.y4)
      @player.coins += 1
      coin.y = 1000
    end
  end
end

def level_one_enemy_collision
  @level_one.enemies.each do |enemy|
    if enemy.contains?(@player.x1, @player.y1) || enemy.contains?(@player.x2, @player.y2) || enemy.contains?(@player.x3, @player.y3) || enemy.contains?(@player.x4, @player.y4)
      @player.lose_life
    end
  end
end

def level_two_collision_detected?
  @level_two.platforms.each do |platform|
    if platform.contains?(@player.x3, @player.y3) || platform.contains?(@player.x4, @player.y4)
      @player.platform_height = @player.y
      @player.y -= 7
      @player.touching_platform = true
    elsif platform.contains?(@player.x1, @player.y1) || platform.contains?(@player.x2, @player.y2)
      @player.jumper_state = nil
    end
  end
end

def has_won?
  if @level_one.goal.contains?(@player.x1, @player.y1) || @level_one.goal.contains?(@player.x2, @player.y2) || @level_one.goal.contains?(@player.x3, @player.y3) || @level_one.goal.contains?(@player.x4, @player.y4)
    @stage_one = false
    @stage_two = true
    @player.reset = true
  end
end

def level_two_enemy_collision?
  if @level_two_enemies.collision_enemy(@player.x1, @player.y1, @player.x2, @player.y2, @player.x3, @player.y3, @player.x4, @player.y4)
    @player.lose_life
  end
end



def game_over
  if @player.lives == 0
    Text.new("Gameover")
  end
end

def player_methods
  @player.jump
  @player.checks_if_falling
  @player.fall_death
  @player.reset
end

def level_methods(level)
  level.add_platforms
  level.add_coins
  level.add_enemies
  level.enemy_movement
  level.add_goal
end

update do
  clear
  if @player.lives > 0 && @stage_one == true
    @level_one.check_enemy_0_boundary
    level_methods(@level_one)
    @player.draw
    level_one_enemy_collision
    level_one_platform_collision
    level_one_coin_collision
    has_won?
    @player.gravity
    player_methods
  elsif @player.lives > 0 && @stage_two == true
    @level_two.add_platforms
    @player.draw
    @level_two_enemies.draw
    @level_two_enemies.move_enemy_1
    @level_two_enemies.move_enemy_2
    @level_two_enemies.move_enemy_3
    @level_two_enemies.enemy_movement
    level_two_enemy_collision?
    level_two_collision_detected?
    @player.gravity
    player_methods
  else
    game_over
  end
end

show
