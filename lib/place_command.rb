require_relative 'command'

class PlaceCommand < Command
  def initialize args_line
    super 'PLACE'
    args = args_line.split ','
    @x = args[0].to_i
    @y = args[1].to_i
    @direction = args[2].downcase.to_sym
  end

  def call robot
    robot.public_send @name, @x, @y, @direction
  end
end
