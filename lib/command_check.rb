# frozen_string_literal: true

require_relative 'robot'

class CommandCheck
  COMMANDS = %w[PLACE MOVE LEFT RIGHT REPORT].freeze

  def first_command_check(command)
    if command.split[0] == 'PLACE'
      puts 'Well done! You have a robot!'
      command_place(command)
    else
      puts 'Please enter PLACE followed by X,Y,DIRECTION'
      false
    end
  end

  def command_check(command)
    return false unless COMMANDS.include?(command.split[0])

    case command
    when 'MOVE'
      @robot.safe_move
    when 'LEFT'
      @robot.left
    when 'RIGHT'
      @robot.right
    when 'REPORT'
      @robot.report
    when 'PLACE'
      command_place(command)
    end
  end

  def place_check(command)
    if command.split(',').length != 3
      puts 'Please enter PLACE followed by X,Y,DIRECTION'
      return false
    end

    x = command.split(',')[0].to_i
    y = command.split(',')[1].to_i
    direction = command.split(',')[2]

    if outside_table_constraints(x) || outside_table_constraints(y)
      puts "Robot can't go there!"
      return false
    elsif !%w[NORTH EAST SOUTH WEST].include?(direction)
      puts "That's not a valid direction!"
      return false
    end
    true
  end

  def command_place(command)
    if command.split[1].nil?
      @robot = Robot.new
    elsif place_check(command.split[1])
      @robot = Robot.new(command)
    end
  end
  private

  def outside_table_constraints(x)
    x.negative? || x > 4
  end
end
