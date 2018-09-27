class Robot
  attr_reader :directions, :facing
  attr_accessor :position

  def initialize
  	@position = nil
    @facing = nil
    @directions = [:north, :east, :south, :west]
  end

  def left
    if @facing.nil?
      fail 'Unknown facing'
    else
      @facing = @directions[(@directions.index(@facing) - 1) % @directions.length]
    end
  end

  def right
    if @facing.nil?
      fail 'Unknown facing'
    else
      @facing = @directions[(@directions.index(@facing) + 1) % @directions.length]
    end
  end

  def update_direction(new_facing)
    if @directions.include?(new_facing)
      @facing = new_facing
    else
      fail 'Invalid facing #{new_facing}'
    end
    nil
  end

  def update_position(new_position)
  	@position = new_position
  end

  def position_to_s
    @position.to_s
  end

  def placed?
    @position.nil? ? false : true
  end

  def to_s
    @facing.to_s.upcase
  end
end