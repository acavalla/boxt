require "robot"

describe 'Robot' do
  it 'initialises in a position and facing a direction' do
    robot = Robot.new(0,0,"NORTH")
    expect(robot.position).to eq([0,0])
    expect(robot.direction).to eq(:N)
  end

  it 'can move in a direction' do
    robot = Robot.new(0,0,"NORTH")
    robot.move()
    expect(robot.position).to eq([1,0])
  end

  it 'cannot fall off the table by moving south from x=0' do
    robot = Robot.new(0,0,"SOUTH")
    robot.move()
    expect(robot.position).to eq([0,0])
  end

  it 'cannot fall off the table by moving east from x=5' do
    robot = Robot.new(5,5,"EAST")
    robot.move()
    expect(robot.position).to eq([5,5])
  end
end
