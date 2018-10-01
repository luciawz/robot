#!/usr/bin/env ruby

require_relative 'lib/simulator'

robot_commands = File.readlines('command.txt')
simulator = Simulator.new

robot_commands.each do | command |
  output = simulator.execute(command)
  puts output if command.chomp == 'REPORT'
end
