class Robot
  attr_reader :position, :direction
  MOVEMENT = { N: [0, 1], S: [0,-1], E: [1,1], W: [1,-1] }
  def initialize(x, y, direction)
    self.place(x, y, direction)
  end

  def place(x, y, direction)
    @position = [x, y]
    @direction = direction[0].to_sym
  end

  def move
    @position[MOVEMENT[@direction][0]] += MOVEMENT[@direction][1]
  end
end
