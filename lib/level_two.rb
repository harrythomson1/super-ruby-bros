class LevelTwo
  
  def draw
    @platform = Rectangle.new(x: 0, y: 430, height: 10, width: 200, color: 'green', z: 1)
    @platform2 = Rectangle.new(x: 250, y: 360, height: 10, width: 100, color: 'green', z: 1)
    @platform3 = Rectangle.new(x: 430, y: 300, height: 10, width: 250, color: 'green', z: 1)
    @platform4 = Rectangle.new(x: 250, y: 250, height: 10, width: 100, color: 'green', z: 1)
    @platform5 = Rectangle.new(x: 0, y: 190, height: 10, width: 200, color: 'green', z: 1)
    @platform6 = Rectangle.new(x: 440, y: 190, height: 10, width: 200, color: 'green', z: 1)
  end

  def collision (x3, y3, x4, y4)
    @platform.contains?(x3, y3) ||
    @platform.contains?(x4, y4) ||    
    @platform2.contains?(x3, y3) ||
    @platform2.contains?(x4, y4) ||    
    @platform3.contains?(x3, y3) ||
    @platform3.contains?(x4, y4) ||    
    @platform4.contains?(x3, y3) ||
    @platform4.contains?(x4, y4) ||    
    @platform5.contains?(x3, y3) ||
    @platform5.contains?(x4, y4) ||    
    @platform6.contains?(x3, y3) ||
    @platform6.contains?(x4, y4) 
  end

  def collision_bottom (x1, y1, x2, y2)
    @platform.contains?(x1, y1) ||
    @platform.contains?(x2, y2) ||    
    @platform2.contains?(x1, y1) ||
    @platform2.contains?(x2, y2) ||    
    @platform3.contains?(x1, y1) ||
    @platform3.contains?(x2, y2) ||    
    @platform4.contains?(x1, y1) ||
    @platform4.contains?(x2, y2) ||    
    @platform5.contains?(x1, y1) ||
    @platform5.contains?(x2, y2) ||    
    @platform6.contains?(x1, y1) ||
    @platform6.contains?(x2, y2) 
  end

end