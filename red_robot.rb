require './lib/parser'
require './lib/robot'
require 'awesome_print'

commands = Parser.new(ARGV).call
robot = Robot.new
commands.each { |c| c.call robot }
