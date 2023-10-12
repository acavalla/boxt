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
      robot = check.command_check('PLACE 4,3,SOUTH')
      robot.report
      expect(robot).to have_received(:puts).with('4,3,SOUTH')
    end
  end
end
