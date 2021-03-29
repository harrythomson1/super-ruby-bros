class LevelThree
  
    def draw
      @platform = Rectangle.new(x: 150, y: Window.height - 85, color: 'red', height: 10, z: 4, width: 77)
      @platform2 = Rectangle.new(x: (Window.width - 200) / 2, y: Window.height - 85, color: 'blue', height: 10, z: 4, width:77)
      @platform3 = Rectangle.new(x: 0, y: Window.height - 550, color: 'red', height: 10, z:4 , width: 77)
      @platform4 = Rectangle.new(x: Window.width - 350, y: Window.height - 175, color: 'orange', height: 10, z: 4, width: 77)
      @platform5 = Rectangle.new(x: 300, y: Window.height - 250, color: 'red', height: 10, z: 4, width: 77)
      @platform6 = Rectangle.new(x: (Window.width - 550) / 2, y: Window.height - 85, color: 'blue', height: 10, z: 4, width:77)
      @platform7 = Rectangle.new(x: 0, y: Window.height - 10, color: 'purple', height: 10, z:4 , width: 77)
      @platform8 = Rectangle.new(x: Window.width - 150, y: Window.height - 210, color: 'orange', height: 10, z: 4, width: 77)
    end

    def collision (x3, y3, x4, y4)
        @platform.contains?(x3, y3) ||
        @platform.contains?(x4, y4) ||   
        @platform2.contains?(x3, y3) ||
        @platform2.contains?(x4, y4) ||
        @platform3.contains?(x3, y3) ||
        @platform3.contains?(x4, y4) ||
        @platform4.contains?(x4, y4) ||
        @platform4.contains?(x4, y4) ||
        @platform5.contains?(x3, y3) ||
        @platform5.contains?(x4, y4) ||   
        @platform6.contains?(x3, y3) ||
        @platform6.contains?(x4, y4) ||
        @platform7.contains?(x3, y3) ||
        @platform7.contains?(x4, y4) ||
        @platform8.contains?(x4, y4) ||
        @platform8.contains?(x4, y4)
      end
    
      def collision_bottom (x1, y1, x2, y2)
        @platform.contains?(x1, y1) ||
        @platform.contains?(x2, y2) ||    
        @platform2.contains?(x1, y1) ||
        @platform2.contains?(x2, y2) ||
        @platform3.contains?(x1, y1) ||
        @platform3.contains?(x2, y2) ||
        @platform4.contains?(x1, y1) ||
        @platform4.contains?(x2, y2) 
        @platform5.contains?(x1, y1) ||
        @platform5.contains?(x2, y2) ||    
        @platform6.contains?(x1, y1) ||
        @platform6.contains?(x2, y2) ||
        @platform7.contains?(x1, y1) ||
        @platform7.contains?(x2, y2) ||
        @platform8.contains?(x1, y1) ||
        @platform8.contains?(x2, y2)         
      end
  
  end