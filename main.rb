# frozen_string_literal: true

require './lib/robot'
require './lib/command_check'

check = CommandCheck.new

puts 'What would you like to do?'
command = gets.chomp!

until check.initial_command_check(command)
  puts 'What would you like to do?'
  command = gets.chomp!
end

robot = Robot.new(*check.initial_command_check(command))

loop do
  puts 'What do you want to do now?'
  command = gets.chomp!
  check.command_check(command, robot)
end
