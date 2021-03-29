class LevelThree
  
    def draw
      @platform = Rectangle.new(x: 150, y: Window.height - 85, color: 'orange', height: 10, z: 4, width: 77)
      @platform2 = Rectangle.new(x: (Window.width - 190) / 2, y: Window.height - 425, color: 'blue', height: 10, z: 4, width:40)
      @platform3 = Rectangle.new(x: 0, y: Window.height - 550, color: 'purple', height: 10, z:4 , width: 77)
      @platform4 = Rectangle.new(x: Window.width - 350, y: Window.height - 175, color: 'white', height: 10, z: 4, width: 77)
      @platform5 = Rectangle.new(x: 125, y: Window.height - 250, color: 'orange', height: 10, z: 4, width: 77)
      @platform6 = Rectangle.new(x: (Window.width - 625), y: Window.height - 150, color: 'red', height: 10, z: 4, width:40)
      @platform7 = Rectangle.new(x: 0, y: Window.height - 10, color: 'orange', height: 10, z:1 , width: 77)
      @platform8 = Rectangle.new(x: Window.width - 150, y: Window.height - 210, color: 'red', height: 10, z: 4, width: 77)
      @platform9 = Rectangle.new(x: (Window.width - 650), y: Window.height - 335, color: 'blue', height: 10, z: 4, width:40)
      @platform10 = Rectangle.new(x: (Window.width - 300), y: Window.height - 340, color: 'red', height: 10, z: 4, width:77)
      @platform11 = Rectangle.new(x: Window.width - 470, y: Window.height - 275, color: 'white', height: 10, z: 4, width: 40)
      @platform12 = Rectangle.new(x: 750, y: Window.height - 30 , color: 'orange', height: 10, z: 4, width: 77)
      @platform13 = Rectangle.new(x: 150, y: Window.height - 450, color: 'purple', height: 10, z: 4, width: 40)
      @platform14 = Rectangle.new(x: 650, y: Window.height - 50, color: 'orange', height: 10, z: 4, width:40)
     # @platform15 = Rectangle.new(x: 0, y: Window.height - 550, color: 'purple', height: 10, z:4 , width: 77)
     # @platform16 = Rectangle.new(x: Window.width - 350, y: Window.height - 175, color: 'white', height: 10, z: 4, width: 77)      
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
        @platform8.contains?(x3, y3) ||
        @platform8.contains?(x4, y4) ||
        @platform9.contains?(x3, y3) ||
        @platform9.contains?(x4, y4) ||
        @platform10.contains?(x3, y3) ||
        @platform10.contains?(x4, y4) ||
        @platform11.contains?(x3, y3) ||
        @platform11.contains?(x4, y4) ||
        @platform12.contains?(x3, y3) ||
        @platform12.contains?(x4, y4) ||
        @platform13.contains?(x3, y3) ||
        @platform13.contains?(x4, y4) ||
        @platform14.contains?(x3, y3) ||
        @platform14.contains?(x4, y4)        
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
        @platform6.contains?(x2, y2) ||
        @platform7.contains?(x1, y1) ||
        @platform7.contains?(x2, y2) ||
        @platform8.contains?(x1, y1) ||
        @platform8.contains?(x2, y2) ||
        @platform9.contains?(x1, y1) ||
        @platform9.contains?(x2, y2) ||    
        @platform10.contains?(x1, y1) ||
        @platform10.contains?(x2, y2) ||
        @platform11.contains?(x1, y1) ||
        @platform11.contains?(x2, y2) ||
        @platform12.contains?(x1, y1) ||
        @platform12.contains?(x2, y2) ||
        @platform13.contains?(x1, y1) ||
        @platform13.contains?(x2, y2) ||
        @platform14.contains?(x1, y1) ||
        @platform14.contains?(x2, y2)            
      end
  
  end