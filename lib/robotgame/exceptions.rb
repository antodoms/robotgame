class InvalidCommand < Exception 
	attr_accessor :message # this is critical!
  def initialize(message)
    @message = message
  end
end