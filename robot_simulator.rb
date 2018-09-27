#!/usr/bin/env ruby

require_relative 'lib/simulator'

if ARGV.length > 0
  puts 'run: ruby robot_simulator.rb without arguments will use the command from commands.txt'
  exit 1
end

robot_commands = File.readlines('command.txt')

simulator = Simulator.new

def execute_robot_commands(command,simulator)
  output = simulator.execute(command)
  puts output if command.chomp == 'REPORT'
end

robot_commands.each do | command |
  execute_robot_commands(command,simulator)
end