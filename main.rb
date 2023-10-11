# frozen_string_literal: true

require './lib/robot'
require './lib/robot_check'

check = RobotCheck.new

puts 'What would you like to do?'
command = gets.chomp!

until check.first_command_check(command)
  puts 'What would you like to do?'
  command = gets.chomp!
end

loop do
  puts 'What do you want to do now?'
  command = gets.chomp!
end
