require 'attr_extras'
require_relative 'command'
require_relative 'place_command'

class Parser
  pattr_initialize :args

  ALLOWED = %w(PLACE MOVE LEFT RIGHT REPORT)

  def call
    commands = []
    while true do
      t = args.shift
      break unless t
      next unless ALLOWED.include? t

      if t.upcase == 'PLACE'
        commands << PlaceCommand.new(args.shift)
      else
        commands << Command.new(t)
      end
    end
    commands
  end
end
