class Sounds
  
  def initialize
    @coin = Sound.new('./assets/coin.wav')
    @jump = Sound.new('./assets/jump.wav')
    @game_over = Sound.new('./assets/gameover.wav')
    @death = Sound.new('./assets/death.wav')
  end

  def coin
    @coin.play
  end

  def jump
    @jump.play
  end

  def game_over
    @game_over.play
  end

  def death
    @death.play
  end


end