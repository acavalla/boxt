class Robot
  attr_reader :position, :direction
  MOVEMENT = { N: [0, 1], S: [0,-1], E: [1,1], W: [1,-1] }
  LIMIT = 5
  CARDINALS = [:N, :E, :S, :W]
  def initialize(x, y, direction)
    self.place(x, y, direction)
  end

  def place(x, y, direction)
    @position = [x, y]
    @direction = direction[0].to_sym
  end

  def move
    @position[MOVEMENT[@direction][0]] += MOVEMENT[@direction][1] if self.allow_move
  end

  def right
    @direction = CARDINALS[CARDINALS.index(:N) - 1]
  end

  private
  def allow_move
    @position.each do | i |
      if i == 0 && (@direction == :S || @direction == :W) || i == LIMIT && (@direction == :N || @direction == (:E))
        return false
      end
    end
  end
end
