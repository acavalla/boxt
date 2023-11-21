# frozen_string_literal: true

require_relative 'robot'

class CommandCheck
  COMMANDS = %w[PLACE MOVE LEFT RIGHT REPORT].freeze

  def command_check(command, robot)
    order = command.split[0]
    return false unless COMMANDS.include?(order)

    follow_order(command, robot)
  end

  def initial_command_check(command)
    order = command.split[0]
    if order == 'PLACE' && command.split.length == 2
      command_place(command, nil)
    else
      puts 'Please enter PLACE followed by X,Y,DIRECTION'
      false
    end
  end

  def command_place(command, robot = nil)
    return unless place_args_valid?(command.split[1])

    x, y, direction = *parse_command(command.split[1])

    return x, y, direction unless robot

    robot.place(x, y, direction)
  end

  private

  def outside_table_constraints(x)
    x.negative? || x > 4
  end

  def parse_command(command)
    x = command.split(',')[0].to_i
    y = command.split(',')[1].to_i
    direction = command.split(',')[2]
    [x, y, direction]
  end

  def follow_order(command, robot)
    case command.split[0]
    when 'MOVE'
      robot.safe_move
    when 'LEFT'
      robot.left
    when 'RIGHT'
      robot.right
    when 'REPORT'
      robot.report
    when 'PLACE'
      command_place(command, robot)
    end
  end

  def no_arguments_after_place?(command)
    command.split[1].nil?
  end

  def place_args_valid?(command)
    if command.split(',').length != 3
      puts 'Please enter PLACE followed by X,Y,DIRECTION'
      return false
    end

    x, y, direction = *parse_command(command)

    valid_parameters?(x, y, direction)
  end

  def valid_parameters?(x, y, direction)
    if outside_table_constraints(x) || outside_table_constraints(y)
      puts "Robot can't go there!"
      return false
    elsif !%w[NORTH EAST SOUTH WEST].include?(direction)
      puts "That's not a valid direction!"
      return false
    end
    true
  end
end
