require 'ruby2d'
require_relative 'player'
require_relative 'sounds'
require_relative 'level_one'
require_relative 'level_two'
require_relative 'level_three'


set title: "Super Ruby Bros", background: 'red', width: 900, height: 700

GRAVITY = 7

@level_one = LevelOne.new
@level_two = LevelTwo.new
@level_three = LevelThree.new
@player = Player.new
@sounds = Sounds.new

@stage_one = true
@stage_two = false
@stage_three = false

on :key_held do |event|
  if event.key == 'a' && @player.x > 0
    @player.x -= 4
    @player.hero.play(flip: :horizontal)
  elsif event.key == 'd' && @player.x < 868
    @player.x += 4
    @player.hero.play
  elsif event.key == 'space' && @player.jumper_state == 'grounded'
    @player.jumper_state = :jumping
    @sounds.jump
  elsif event.key == 'return'
    @player.hard_reset = true
    @stage_one = true
    @stage_two = false
    @stage_three = false
  end
end


on :key_up do |event|
  if event.key == 'space'
    @player.jumper_state = nil
  end
end

def platform_collision
  if @stage_one == true
    @level_one.platforms.each do |platform|
      if platform.contains?(@player.square.x3, @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
        @player.landed_on_platform
      elsif platform.contains?(@player.square.x1, @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
        @player.jumper_state = nil
      end
    end
  elsif @stage_two == true
    @level_two.platforms.each do |platform|
      if platform.contains?(@player.square.x3, @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
        @player.landed_on_platform
      elsif platform.contains?(@player.square.x1, @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
        @player.jumper_state = nil
      end
    end
  elsif @stage_three == true
    @level_three.platforms.each do |platform|
      if platform.contains?(@player.square.x3, @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
        @player.landed_on_platform
      elsif platform.contains?(@player.square.x1, @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
        @player.jumper_state = nil
      end
    end
  end
end

def coin_collision
  if @stage_one == true
    @level_one.coins.each do |coin|
      if coin.contains?(@player.square.x1, @player.square.y1) || coin.contains?(@player.square.x2, @player.square.y2) || coin.contains?(@player.square.x3, @player.square.y3) || coin.contains?(@player.square.x4, @player.square.y4)
        @player.coins += 1
        @sounds.coin
        coin.y = 1000
      end
    end
  elsif @stage_two == true
    @level_two.coins.each do |coin|
      if coin.contains?(@player.square.x1, @player.square.y1) || coin.contains?(@player.square.x2, @player.square.y2) || coin.contains?(@player.square.x3, @player.square.y3) || coin.contains?(@player.square.x4, @player.square.y4)
        @player.coins += 1
        @sounds.coin
        coin.y = 1000
      end
    end
  elsif @stage_three == true
    @level_three.coins.each do |coin|
      if coin.contains?(@player.square.x1, @player.square.y1) || coin.contains?(@player.square.x2, @player.square.y2) || coin.contains?(@player.square.x3, @player.square.y3) || coin.contains?(@player.square.x4, @player.square.y4)
        @player.coins += 1
        @sounds.coin
        coin.y = 1000
      end
    end
  end
end

def enemy_collison
  if @stage_one == true
    @level_one.enemies.each do |enemy|
      if enemy.contains?(@player.square.x1, @player.square.y1) || enemy.contains?(@player.square.x2, @player.square.y2) || enemy.contains?(@player.square.x3, @player.square.y3) || enemy.contains?(@player.square.x4, @player.square.y4)
        @player.lose_life
        @sounds.death
      end
    end
  elsif @stage_three == true
    @level_three.enemies.each do |enemy|
      if enemy.contains?(@player.square.x1, @player.square.y1) || enemy.contains?(@player.square.x2, @player.square.y2) || enemy.contains?(@player.square.x3, @player.square.y3) || enemy.contains?(@player.square.x4, @player.square.y4)
        @player.lose_life
        @sounds.death
      end
    end
  end
end

def has_won?
  if @stage_one == true
    if @level_one.goal.contains?(@player.square.x1, @player.square.y1) || @level_one.goal.contains?(@player.square.x2, @player.square.y2) || @level_one.goal.contains?(@player.square.x3, @player.square.y3) || @level_one.goal.contains?(@player.square.x4, @player.square.y4)
      @stage_one = false
      @stage_two = true
      @player.reset = true
    end
  elsif @stage_two == true
    if @level_two.goal.contains?(@player.square.x1, @player.square.y1) || @level_two.goal.contains?(@player.square.x2, @player.square.y2) || @level_two.goal.contains?(@player.square.x3, @player.square.y3) || @level_two.goal.contains?(@player.square.x4, @player.square.y4)
      @stage_two = false
      @stage_three = true
      @player.reset = true
    end
  end
end

def player_methods
  @player.jump
  @player.checks_if_falling
  @player.fall_death
  @player.reset
  @player.hard_reset
end

def level_methods(level)
  level.add_assets
  level.enemy_movement
end

update do
  clear
  @player.draw
  platform_collision
  coin_collision
  enemy_collison
  background = Image.new('./assets/bg.png', z: 3)
  @player.hero.x = @player.x
  @player.hero.y = @player.y
  @player.hero.add
  has_won?
  @player.gravity
  player_methods
  if @player.lives > 0 && @stage_one == true
    @level_one.check_enemy_0_boundary
    level_methods(@level_one)
    @level_one.coin_animation
  elsif @player.lives > 0 && @stage_two == true 
    @level_two.add_assets
    @level_two.coin_animation
  elsif @player.lives > 0 && @stage_three == true
    level_methods(@level_three)
    @level_three.coin_animation
    @level_three.check_enemy_0_boundary
    @level_three.check_enemy_1_boundary
    @level_three.check_enemy_2_boundary
  else
    background = Image.new('./assets/gameover.png', z: 3, x: 150, y: 200) 
    endgame_text = Text.new('Coins Collected', z: 4, color: 'red', size: 25, x: 360, y: 500 ) 
    total_coins = Text.new(@player.coins, z: 4, color: 'red', size: 40, x: 438, y: 540) 
    endgame_text = Text.new('Hit Enter to try again...', z: 4, color: 'red', size: 20, x:350, y: 600 )
  end
end

show
