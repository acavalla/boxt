class Robot
  attr_reader :position, :direction
  def initialize(x, y, direction)
    self.place(x, y, direction)
  end

  def place(x, y, direction)
    @position = [x, y]
    @direction = direction[0].to_sym
  end

  def move
    case @direction
    when :N
      @position[0] += 1
    when :S
      @position[0] -= 1
    when :E
      @position[1] += 1
    when :W
      @position[1] -= 1
    end
  end
end
