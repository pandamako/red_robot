class Command
  attr_reader :name

  def initialize name
    @name = name.downcase
  end

  def call robot
    robot.public_send @name
  end
end
