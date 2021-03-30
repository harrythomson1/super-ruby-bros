require 'ruby2d'
require_relative 'player'
require_relative 'level_one'
require_relative 'level_three'


set title: "Super Ruby Bros", background: 'red', width: 900, height: 700

GRAVITY = 7

@level_one = LevelOne.new
@level_three = LevelThree.new
@player = Player.new

@stage_one = true
@stage_three = false

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
    if platform.contains?(@player.square.x3, @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
      @player.platform_height = @player.y
      @player.y -= 7
      @player.touching_platform = true
    elsif platform.contains?(@player.square.x1, @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
      @player.jumper_state = nil
    end
  end
end

def level_one_coin_collision
  @level_one.coins.each do |coin|
    if coin.contains?(@player.square.x1, @player.square.y1) || coin.contains?(@player.square.x2, @player.square.y2) || coin.contains?(@player.square.x3, @player.square.y3) || coin.contains?(@player.square.x4, @player.square.y4)
      @player.coins += 1
      coin.y = 1000
    end
  end
end

def level_one_enemy_collision
  @level_one.enemies.each do |enemy|
    if enemy.contains?(@player.square.x1, @player.square.y1) || enemy.contains?(@player.square.x2, @player.square.y2) || enemy.contains?(@player.square.x3, @player.square.y3) || enemy.contains?(@player.square.x4, @player.square.y4)
      @player.lose_life
    end
  end
end

def level_three_platform_collision
  @level_three.platforms.each do |platform|
    if platform.contains?(@player.square.x3, @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
      @player.platform_height = @player.y
      @player.y -= 7
      @player.touching_platform = true
    elsif platform.contains?(@player.square.x1, @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
      @player.jumper_state = nil
    end
  end
end

def level_three_enemy_collision
  @level_three.enemies.each do |enemy|
    if enemy.contains?(@player.square.x1, @player.square.y1) || enemy.contains?(@player.square.x2, @player.square.y2) || enemy.contains?(@player.square.x3, @player.square.y3) || enemy.contains?(@player.square.x4, @player.square.y4)
      @player.lose_life
    end
  end
end

def has_won?
  if @level_one.goal.contains?(@player.square.x1, @player.square.y1) || @level_one.goal.contains?(@player.square.x2, @player.square.y2) || @level_one.goal.contains?(@player.square.x3, @player.square.y3) || @level_one.goal.contains?(@player.square.x4, @player.square.y4)
    @stage_one = false
    @stage_three = true
    @player.reset = true
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
  elsif @player.lives > 0 && @stage_three == true
    @level_three.add_platforms
    @level_three.add_enemies
    @level_three.check_enemy_0_boundary
    @level_three.check_enemy_1_boundary
    @level_three.check_enemy_2_boundary
    @level_three.enemy_movement
    @player.draw
    level_three_enemy_collision
    level_three_platform_collision
    @player.gravity
    player_methods
  else
    game_over
  end
end

show
