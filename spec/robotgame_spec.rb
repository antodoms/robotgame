require "spec_helper"

describe Robotgame do
  it "has a version number" do
    expect(Robotgame::VERSION).not_to be nil
  end

  before(:all) do
    @robot = Robotgame::Robot.new
  end

  describe 'command testing with placing the robot on table' do

    it 'returns an exception "argument error" until a valid place value is not provided' do
      expect { @robot.run("move") }.to raise_error(InvalidCommand, "cannot move before placing on table")
    end

    it 'returns an exception "cannot report before placing on table" until a valid place value is not provided' do
      expect { @robot.run("report") }.to raise_error(InvalidCommand, "cannot report before placing on table")
    end

    it 'returns an exception "cannot turn left before placing on table" until a valid place value is not provided' do    
      expect { @robot.run("left") }.to raise_error(InvalidCommand, "cannot turn left before placing on table")
    end

    it 'returns an exception "cannot turn right before placing on table" until a valid place value is not provided' do   
      expect { @robot.run("right") }.to raise_error(InvalidCommand, "cannot turn right before placing on table")
    end

  end

  describe 'place command testing' do

    it 'returns the place position correctly when the place is placed correctly' do
      
      @robot.run("place 0,0,north")

      expect(@robot.run("report")).to be_a String
      expect(@robot.run("report")).to eq '0,0,NORTH'
    end

    it 'returns an exception "x coordinate exceeds bound" when the x coordinate is placed incorrectly' do
      expect { @robot.run("place 6,0,north") }.to raise_error(InvalidCommand, "x coordinate exceeds bound")
    end

    it 'returns an exception "y coordinate exceeds bound" when the y coordinate is placed incorrectly' do
      expect { @robot.run("place 0,6,north") }.to raise_error(InvalidCommand, "y coordinate exceeds bound")
    end

    it 'returns an exception "x and y coordinate exceeds bound" when the x and y coordinate is placed incorrectly' do
      expect { @robot.run("place 6,6,north") }.to raise_error(InvalidCommand, "x and y coordinate exceeds bound")
    end

    it 'returns an exception "place arguments does not exist" when no arguments are provided after place' do
      expect { @robot.run("place") }.to raise_error(InvalidCommand, "place arguments does not exist")
    end

    it 'returns an exception "Incorrect number of arguments" when incorrect number of arguments are provided' do
      expect { @robot.run("place a") }.to raise_error(InvalidCommand, "Incorrect number of arguments")
    end

    it 'return an exception "Incorrect number of arguments" when more arguments are put in place command' do
      expect { @robot.run("place 0,0,north,left") }.to raise_error(InvalidCommand, "Incorrect number of arguments")
    end
  end


  describe 'move, left, right command testing' do
    it 'return an exception "y coordinate exceeds bound" and also prints report correctly when move beyond the table and try to print report' do
      @robot.run("place 4,4,north")
      @robot.run("move")
      expect { @robot.run("move") }.to raise_error(InvalidCommand, "y coordinate exceeds bound")
      expect(@robot.run("report")).to eq '4,5,NORTH'
    end

    it 'return correct report after right turn and throws an exception when move out of table' do
      @robot.run("place 4,4,north")
      @robot.run("move")
      expect { @robot.run("move") }.to raise_error(InvalidCommand, "y coordinate exceeds bound")
      @robot.run("right")
      @robot.run("move")
      expect(@robot.run("report")).to eq '5,5,EAST'
    end
  end

  describe 'example tests' do
    it 'should output "0,1,NORTH" when example 1 is tested' do
      @robot.run("place 0,0,north")
      @robot.run("move")
      expect(@robot.run("report")).to eq '0,1,NORTH'
    end

    it 'should output "0,0,WEST" when example 2 is tested' do
      @robot.run("place 0,0,north")
      @robot.run("left")
      expect(@robot.run("report")).to eq '0,0,WEST'
    end

    it 'should output "3,3,NORTH" when example 3 is tested' do
      @robot.run("place 1,2,east")
      @robot.run("move")
      @robot.run("move")
      @robot.run("left")
      @robot.run("move")
      expect(@robot.run("report")).to eq '3,3,NORTH'
    end
  end

end
