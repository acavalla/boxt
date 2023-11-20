# frozen_string_literal: true

require 'robot'
require 'command_check'

describe 'Domain' do
  before do
    Robot.any_instance.stub(:puts)
  end

  context 'placing a robot and reporting its position' do
    it 'is placed in the correct location' do
      check = CommandCheck.new
      robot = Robot.new(4, 3, 'SOUTH')
      check.command_check('MOVE', robot)
      expect(robot.position).to eq [4, 2]
    end
  end

  context 'placing a robot when a robot is present' do
    it 'calls PLACE on the current robot when the command is PLACE' do
      check = CommandCheck.new
      robot = Robot.new(4,3, 'SOUTH')
      check.command_check('PLACE 0,0,NORTH', robot)
      check.command_check('PLACE 0,0,EAST', robot)

      expect(robot.direction).to eq :EAST
    end
  end
end
