# frozen_string_literal: true

require 'command_check'

describe CommandCheck do
  let(:Robot) { class_double(Robot) }
  let(:robot) { instance_double(Robot, safe_move: nil, left: nil, right: nil, report: nil) }

  before do
    @check = CommandCheck.new
    CommandCheck.any_instance.stub(:puts)
  end

  context 'first_command_check' do
    it 'returns a robot if the string is PLACE' do
      allow(Robot).to receive(:new).and_return(robot)
      expect(@check.first_command_check('PLACE')).to eq(robot)
    end

    it 'returns a robot if the string has valid coordinates and direction in PLACE X,Y,DIRECTION' do
      allow(Robot).to receive(:new).and_return(robot)
      expect(@check.first_command_check('PLACE 0,0,NORTH')).to eq(robot)
    end

    it 'returns nil and outputs a helpful message if there are insufficient arguments following PLACE' do
      command = 'PLACE ROBOT'
      expect(@check.first_command_check(command)).to be nil
      expect(@check).to have_received(:puts).with('Please enter PLACE followed by X,Y,DIRECTION')
    end

    it 'returns nil and outputs a helpful message if the coordinates are outside table constraints' do
      command = 'PLACE 0,5,NORTH'
      expect(@check.first_command_check(command)).to be nil
      expect(@check).to have_received(:puts).with("Robot can't go there!")
    end

    it 'returns nil and outputs a helpful message if the direction is not valid' do
      command = 'PLACE 0,0,FLINT'
      expect(@check.first_command_check(command)).to be nil
      expect(@check).to have_received(:puts).with("That's not a valid direction!")
    end
  end

  context 'command_check' do
    it 'checks an input is one of a few permitted strings' do
      expect(@check.command_check('HI ROBOT')).to be false
    end

    it 'calls move on the robot when the command is MOVE' do
      allow(Robot).to receive(:new).and_return(robot)
      @check.first_command_check('PLACE')

      expect(robot).to receive(:safe_move)
      @check.command_check('MOVE')
    end

    it 'calls left on the robot when the command is LEFT' do
      allow(Robot).to receive(:new).and_return(robot)
      @check.first_command_check('PLACE')

      expect(robot).to receive(:left)
      @check.command_check('LEFT')
    end

    it 'calls right on the robot when the command is RIGHT' do
      allow(Robot).to receive(:new).and_return(robot)
      @check.first_command_check('PLACE')

      expect(robot).to receive(:right)
      @check.command_check('RIGHT')
    end

    it 'calls report on the robot when the command is REPORT' do
      allow(Robot).to receive(:new).and_return(robot)
      @check.first_command_check('PLACE')

      expect(robot).to receive(:report)
      @check.command_check('REPORT')
    end
  end
end
