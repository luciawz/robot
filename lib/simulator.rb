require_relative '../lib/robot'
require_relative '../lib/table'
require_relative '../lib/position'

class Simulator
  attr_accessor :table, :robot

  def initialize(width = 5, height = 5)
    @table = Table.new(width, height)
    @robot = Robot.new
  end

  def execute(line)
    return nil if line.strip.empty?
    tokens = line.split(/\s+/)
    fail 'Please input PLACE command first to init.' unless tokens.first == "PLACE"
    tokens.each_with_index do |token, index|
      operator = token
      (token == "PLACE") ? arguments = tokens[index + 1] : arguments = nil
      output = execute_command(operator, arguments)
      puts output if operator.chomp == 'REPORT'
    end
  end

  def execute_command(operator, arguments)
    case operator
    when 'PLACE'
      place(arguments)
    when 'REPORT'
      report
    when 'MOVE'
      move
    when 'LEFT'
      left
    when 'RIGHT'
      right
    end
  end

  def place(arguments)
    tokens = arguments.split(/,/)
    x = tokens[0].to_i
    y = tokens[1].to_i
    facing = tokens[2].downcase.to_sym
    place_robot(x, y, facing)
    nil
  end

  def report
    @robot.position_to_s + ',' + @robot.facing.to_s.upcase unless @robot.position.nil? && @robot.facing.nil?
  end

  def left
    return nil unless @robot.placed?
    @robot.left
  end

  def right
    return nil unless @robot.placed?
    @robot.right
  end

  def move
    fail 'Robot not found' if @robot.nil?

    case @robot.facing
    when :north
      move_position(0, 1, @table)
    when :south
      move_position(0, -1, @table)
    when :east
      move_position(1, 0, @table)
    when :west
      move_position(-1, 0, @table)
    else
      fail 'No such move. Invalid facing'
    end
    nil
  end

  private
  def valid_position(position, table)
    if (position.x_coordinate < 0 || position.x_coordinate > table.rows) ||
        (position.y_coordinate < 0 || position.y_coordinate > table.columns)
      false
    else
      true
    end
  end

  def update_position(position)
    @position.update(position.x_coordinate, position.y_coordinate) if valid_position(position, @table)
  end

  def move_position(x_value, y_value, table)
    new_position = Position.new x_value+@robot.position.x_coordinate, y_value+@robot.position.y_coordinate
    fail 'Invalid move in position. #' unless valid_position(new_position, table)
    @robot.update_position new_position
  end

  def place_robot(x_coordinate, y_coordinate, facing)
    replace Position.new(x_coordinate, y_coordinate)
    fail 'Fail to place robot. Invalid position.' unless @robot.placed?
    @robot.update_direction facing
  end

   def replace(position)
    @robot.position = position if valid_position(position, @table)
  end
end