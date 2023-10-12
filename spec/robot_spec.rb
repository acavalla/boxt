# frozen_string_literal: true

require 'robot'

describe 'Robot' do
  before do
    @robot = Robot.new(0, 0, 'NORTH')
    Robot.any_instance.stub(:puts)
  end

  context 'initialise' do
    it 'initialises in a position and facing a direction' do
      expect(@robot.position).to eq([0, 0])
      expect(@robot.direction).to eq(:NORTH)
    end
  end

  context 'move' do
    it 'can move according to the direction it is facing' do
      @robot.safe_move
      expect(@robot.position).to eq([1, 0])
    end

    it 'cannot fall off the table by moving north from x=4' do
      robot = Robot.new(4, 2, 'NORTH')
      robot.safe_move
      expect(robot.position).to eq([4, 2])
    end

    it 'cannot fall off the table by moving south from x=0' do
      robot = Robot.new(0, 2, 'SOUTH')
      robot.safe_move
      expect(robot.position).to eq([0, 2])
    end

    it 'cannot fall off the table by moving east from y=4' do
      robot = Robot.new(2, 4, 'EAST')
      robot.safe_move
      expect(robot.position).to eq([2, 4])
    end

    it 'cannot fall off the table by moving west from y=0' do
      robot = Robot.new(2, 0, 'WEST')
      robot.safe_move
      expect(robot.position).to eq([2, 0])
    end
  end

  context 'right' do
    it 'can turn right from south and will then be facing west' do
      robot = Robot.new(0, 0, 'SOUTH')
      robot.right
      expect(robot.direction).to eq(:WEST)
    end

    it 'can go right from west and will then be facing north' do
      robot = Robot.new(0, 0, 'WEST')
      robot.right
      expect(robot.direction).to eq(:NORTH)
    end
  end

  context 'left' do
    it 'can turn left from south and will then be facing east' do
      robot = Robot.new(0, 0, 'SOUTH')
      robot.left
      expect(robot.direction).to eq(:EAST)
    end
  end

  context 'report' do
    it 'outputs its position and direction' do
      @robot.report
      expect(@robot).to have_received(:puts).with('0,0,NORTH')
    end
  end
end
