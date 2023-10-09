class Robot
  attr_reader :position, :direction
  MOVEMENT = { NORTH: [0, 1], SOUTH: [0,-1], EAST: [1,1], WEST: [1,-1] }
  LIMIT = 5
  CARDINALS = [:NORTH, :EAST, :SOUTH, :WEST, :NORTH, :WEST]
  def initialize(x = 0, y = 0, direction = :NORTH)
    self.place(x, y, direction)
  end

  def place(x, y, direction)
    @position = [x.to_i, y.to_i]
    @direction = direction.to_sym
  end

  def safe_move
    if self.allow_move
      move(position)
      puts "Robot moved!"
    end
  end

  def right
    @direction = CARDINALS[CARDINALS.index(@direction) + 1]
  end

  def left
    @direction = CARDINALS[CARDINALS.index(@direction) - 1]
  end
  def report
    print "#{position.join(',')},#{direction}"
  end

  private
  def move(position)
    position[MOVEMENT[direction][0]] += MOVEMENT[direction][1]
  end
  def allow_move
    new_position = position.map(&:clone)
    move(new_position)
    new_position.each do | i |
      if i < 0 || i > 5
        return false
      end
    end
  end
end
