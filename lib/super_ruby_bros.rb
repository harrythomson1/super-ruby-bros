require 'ruby2d'
require_relative 'player'
require_relative 'level_one'
require_relative 'level_two'
require_relative 'level_three'


set title: "Super Ruby Bros", background: 'red', width: 900, height: 700

GRAVITY = 7

@level_one = LevelOne.new
@level_two = LevelTwo.new
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

def level_two_platform_collision
  @level_two.platforms.each do |platform|
    if platform.contains?(@player.square.x3, @player.square.y3) || platform.contains?(@player.square.x4, @player.square.y4)
      @player.platform_height = @player.y
      @player.y -= 7
      @player.touching_platform = true
    elsif platform.contains?(@player.square.x1, @player.square.y1) || platform.contains?(@player.square.x2, @player.square.y2)
      @player.jumper_state = nil
    end
  end
end

def level_two_coin_collision
  @level_two.coins.each do |coin|
    if coin.contains?(@player.square.x1, @player.square.y1) || coin.contains?(@player.square.x2, @player.square.y2) || coin.contains?(@player.square.x3, @player.square.y3) || coin.contains?(@player.square.x4, @player.square.y4)
      @player.coins += 1
      coin.y = 1000
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
  background = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\bg.png', z: 3)
  @hero = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\hero.png', z: 5)
  @hero.x = @player.x - 5
  @hero.y = @player.y - 30 
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
    level_methods(@level_two)
    @player.draw
    level_two_platform_collision
    level_two_coin_collision
    has_won?
    @player.gravity
    player_methods
    box_1 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: 0, y: Window.height - 550)
    box_2 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: Window.width - 350, y: Window.height - 175)
    box_3 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4,x: 125, y: Window.height - 250)
    box_4 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: (Window.width - 625), y: Window.height - 150)
    box_5 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: 0, y: Window.height - 10)
    box_6 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: Window.width - 150, y: Window.height - 210)
    box_7 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: (Window.width - 650), y: Window.height - 335)
    box_8 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: (Window.width - 300), y: Window.height - 340)
    box_9 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: 150, y: Window.height - 85)
    box_10 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: (Window.width - 190) / 2, y: Window.height - 425)
    box_11 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: Window.width - 470, y: Window.height - 275)
    box_12 = Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\RUBY_GAME_2\super-ruby-bros\assets\wood.png', z: 4, x: 750, y: Window.height - 30 ) 

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
