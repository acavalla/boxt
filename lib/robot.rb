class Robot
  attr_reader :position, :direction
  MOVEMENT = { N: [0, 1], S: [0,-1], E: [1,1], W: [1,-1] }
  LIMIT = 5
  CARDINALS = [:N, :E, :S, :W, :N, :W]
  def initialize(x, y, direction)
    self.place(x, y, direction)
  end

  def place(x, y, direction)
    @position = [x, y]
    @direction = direction[0].to_sym
  end

  def safe_move
    move(position) if self.allow_move
  end

  def right
    @direction = CARDINALS[CARDINALS.index(@direction) + 1]
  end

  def left
    @direction = CARDINALS[CARDINALS.index(@direction) - 1]
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
