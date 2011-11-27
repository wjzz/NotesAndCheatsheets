#! ruby -w

class Point
    attr_reader :x, :y
    attr_writer :x, :y
   
    def initialize(x = 0, y = 0)
        @x = x
        @y = y
    end
   
    def to_s
       "(#@x, #@y)"
    end
end

class Board
    MAX_X = 80
    MAX_Y = 50

    def initialize
        @list = []
    end
    
    def add_point(point)
        @list.push(point) if point.x < MAX_X && point.y < MAX_Y
        self
    end
end

b = Board.new
b2 = Board.new

puts b.object_id
puts b2.object_id

# singleton
class S
    private_class_method :new
    @@instance = nil
    def S.create
        @@instance = new unless @@instance
        @@instance
    end
end

puts S.create.object_id
puts S.create.object_id