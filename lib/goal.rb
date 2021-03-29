class Goal

  def initialize(x1: 0, x2: 0, x3: 0, y1: 0, y2: 0, y3: 0)
    @x1 = x1
    @x2 = x2
    @x3 = x3
    @y1 = y1
    @y2 = y2
    @y3 = y3
  end

  def draw
    @goal = Triangle.new(x1: @x1, x2: @x2, x3: @x3, y1: @y1, y2: @y2, y3: @y3, color: 'fuchsia', z: 1)
  end

  def collision (x1, y1, x2, y2, x3, y3, x4, y4)
    @goal.contains?(x1, y1) ||
    @goal.contains?(x2, y2) ||
    @goal.contains?(x3, y3) ||
    @goal.contains?(x4, y4)
  end

end
