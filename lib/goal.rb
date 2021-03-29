class Goal
  
  attr_reader :goal

  def draw
    @goal = Triangle.new(x1: 40, x2: 80, x3: 0, y1: 120, y2: 190, y3: 190, color: 'fuchsia', z: 1)
  end

  def collision (x1, y1, x2, y2, x3, y3, x4, y4) 
    @goal.contains?(x1, y1) ||
    @goal.contains?(x2, y2) ||   
    @goal.contains?(x3, y3) ||
    @goal.contains?(x4, y4)
  end

end