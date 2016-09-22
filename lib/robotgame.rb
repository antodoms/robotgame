require "robotgame/version"
require "robotgame/commands"
require "robotgame/exceptions"
#require "robotgame/direction"

module Robotgame
		class Robot
			include Commands
		  def initialize(table_size=5, output=STDOUT)
		    @table = table_size
		    @output = output
		  end

		  def run(cmd)
		    commandlist = cmd.downcase.split(/\s/)
		    
		    raise InvalidCommand.new if commandlist.count == 0

		      #binding.pry
		    if Commands.public_method_defined?(commandlist[0])
		      begin
		        func = commandlist[0]
		        #binding.pry
		        if method(func).arity > 0
		          #binding.pry

		          arguments = commandlist[1].split(/,/)
		         

		          if arguments.count == method(func).arity
		              #binding.pry
		              self.send(func, *arguments)
		          else
		          		raise InvalidCommand.new("Incorrect number of arguments")
		          end

		        else
		            	self.send(func)
		        end
		      rescue ArgumentError
		          raise InvalidCommand.new("argument error")
		      rescue NoMethodError
		      		raise InvalidCommand.new("place arguments does not exist")
		      end
		    end
		  end

		  def run_script(io)
		    io.each_line do |line|
		      begin
		        self.execute(line)
		      rescue InvalidCommand
		        #puts "(Ignored invalid command)"
		      end
		    end
		  end

		  private
		  def validate(x, y, f)
		      raise InvalidCommand.new("place parameters format incorrect") unless x && y && f
		      raise InvalidCommand.new("x and y coordinate exceeds bound") unless ((0..@table) === x || (0..@table) === y)
		      raise InvalidCommand.new("x coordinate exceeds bound") unless (0..@table) === x
		      raise InvalidCommand.new("y coordinate exceeds bound") unless (0..@table) === y
		  end
		end
end
