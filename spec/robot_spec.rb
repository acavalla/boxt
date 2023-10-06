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
end
