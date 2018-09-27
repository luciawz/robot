#!/usr/bin/env ruby

require_relative 'lib/simulator'

robot_commands = File.readlines('command.txt')
simulator = Simulator.new

robot_commands.each do | command |
  simulator.execute(command)
end
