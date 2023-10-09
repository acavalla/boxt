require "./lib/robot.rb"
command = ""
until command.split[0] == "PLACE"
  puts "What would you like to do?"
  command = gets.chomp!
end

if command.split.length == 2
  x = command.split()[1].split(",")[0]
  y = command.split()[1].split(",")[1]
  direction = command.split()[1].split(",")[2]
  robot = Robot.new(x, y, direction)
else
  robot = Robot.new()
end
puts "Well done! You have a robot!"

loop do
  puts "What do you want to do now?"
  command = gets.chomp!
  if command == "MOVE"
    robot.safe_move
  elsif command == "LEFT"
    robot.left
  elsif command == "RIGHT"
    robot.right
  elsif command == "REPORT"
    robot.report
  elsif command.includes?("PLACE")
    if command.split.length == 2
      x, y, direction = command.split()[1].split
      robot.place(x, y, direction)
    else
      robot.place()
    end
  end
end
