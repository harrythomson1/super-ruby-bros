class Goal
  
  attr_reader :goal

  def draw
    @goal = Triangle.new(x1: 40, x2: 80, x3: 0, y1: 125, y2: 195, y3: 195, color: 'fuchsia', z: 0)
  end

  def collision (x3, y3, x4, y4) 
    @goal.contains?(x3, y3) ||
    @goal.contains?(x4, y4)
  end

end