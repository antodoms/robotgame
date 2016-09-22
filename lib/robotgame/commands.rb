# Mixin for Robot
require "robotgame/direction"
#require "pry"
module Commands
  #include Direction
  def place(x, y, facing)
    validate(x = (x.to_i if /\A\d+\Z/.match(x)),
             y = (y.to_i if /\A\d+\Z/.match(y)),
             facing = Direction[facing.upcase])
    @x, @y, @facing = x, y, facing
    #binding.pry
    return;
    #@output.puts "#{@x},#{@y},#{@face}"
  end

  def move
    raise InvalidCommand.new("cannot move before placing on table") unless @facing
    new_x, new_y = @facing.advance(@x, @y)
    validate(new_x, new_y, @facing)
    @x, @y = new_x, new_y
    #binding.pry
    return;
  end

  def left
    raise InvalidCommand.new("cannot turn left before placing on table") unless @facing
    @facing = @facing.left
    #binding.pry
    return;
  end

  def right
    raise InvalidCommand.new("cannot turn right before placing on table") unless @facing
    @facing = @facing.right
    #binding.pry
    return;
  end

  def report
    raise InvalidCommand.new("cannot report before placing on table") unless @facing
    #@output.puts "#{@x},#{@y},#{@facing}"
    #binding.pry
    return "#{@x},#{@y},#{@facing}"
  end
end