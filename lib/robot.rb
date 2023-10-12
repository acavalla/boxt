# frozen_string_literal: true

class Robot
  attr_reader :position, :direction

  MOVEMENT = { NORTH: [1, 1], SOUTH: [1, -1], EAST: [0, 1], WEST: [0, -1] }.freeze
  LIMIT = 5
  CARDINALS = %i[NORTH EAST SOUTH WEST NORTH WEST].freeze

  def initialize(x, y, direction)
    puts 'Well done! You have a robot!'
    place(x, y, direction)
  end

  def place(x, y, direction)
    @position = [x, y]
    @direction = direction.to_sym
  end

  def safe_move
    return unless allow_move

    move(position)
    puts 'Robot moved!'
  end

  def right
    @direction = CARDINALS[CARDINALS.index(direction) + 1]
  end

  def left
    @direction = CARDINALS[CARDINALS.index(direction) - 1]
  end

  def report
    puts "#{position.join(',')},#{direction}"
  end

  private

  def move(position)
    position[MOVEMENT[direction][0]] += MOVEMENT[direction][1]
  end

  def allow_move
    new_position = position.map(&:clone)
    move(new_position)
    new_position.each do |i|
      if i.negative? || i > LIMIT - 1
        puts 'Are you trying to murder your robot? The computers will remember this in the uprising'
        return false
      end
    end
  end
end
