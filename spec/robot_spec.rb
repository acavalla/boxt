require "robot"

describe 'Robot' do
  context 'initialise' do
    it 'initialises in a position and facing a direction' do
      robot = Robot.new(0,0,"NORTH")
      expect(robot.position).to eq([0,0])
      expect(robot.direction).to eq(:NORTH)
    end
  end

  context 'move' do
    it 'can move according to the direction it is facing' do
      robot = Robot.new(0,0,"NORTH")
      robot.safe_move()
      expect(robot.position).to eq([1,0])
    end

    it 'cannot fall off the table by moving north from x=5' do
      robot = Robot.new(5,2,"NORTH")
      robot.safe_move()
      expect(robot.position).to eq([5,2])
    end

    it 'cannot fall off the table by moving south from x=0' do
      robot = Robot.new(0,2,"SOUTH")
      robot.safe_move()
      expect(robot.position).to eq([0,2])
    end

    it 'cannot fall off the table by moving east from y=5' do
      robot = Robot.new(2,5,"EAST")
      robot.safe_move()
      expect(robot.position).to eq([2,5])
    end

    it 'cannot fall off the table by moving west from y=0' do
      robot = Robot.new(2,0,"WEST")
      robot.safe_move()
      expect(robot.position).to eq([2,0])
    end
  end

  context 'right' do
    it 'can turn right from south and will then be facing west' do
      robot = Robot.new(0,0,"SOUTH")
      robot.right()
      expect(robot.direction).to eq(:WEST)
    end

    it 'can go right from west and will then be facing north' do
      robot = Robot.new(0,0,"WEST")
      robot.right()
      expect(robot.direction).to eq(:NORTH)
    end
  end

  context 'left' do
    it 'can turn left from south and will then be facing east' do
      robot = Robot.new(0,0,"SOUTH")
      robot.left()
      expect(robot.direction).to eq(:EAST)
    end
  end

  context 'report' do
    it 'outputs its position and direction' do
      robot = Robot.new(0,0,"SOUTH")
      expect do
        robot.report
      end.to output('0,0,SOUTH').to_stdout
    end
  end
end
