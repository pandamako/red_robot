require 'awesome_print'

class Robot
  X_MAX = 4
  Y_MAX = 4
  DIRECTIONS = %i(north east south west)

  attr_reader :x, :y

  def initialize
    @is_placed = false
    @direction_index = 0
  end

  def place x, y, direction
    return unless validate_position x, y
    @x = x
    @y = y
    @direction_index = DIRECTIONS.index direction
    @is_placed = true
  end

  def move
    return unless @is_placed
    x1, y1 = send "next_position_#{direction}"
    if validate_position x1, y1
      @x = x1
      @y = y1
      true
    end
  end

  def left
    return unless @is_placed
    @direction_index -= 1
    @direction_index = DIRECTIONS.size - 1 if @direction_index < 0
    true
  end

  def right
    return unless @is_placed
    @direction_index += 1
    @direction_index = 0 if @direction_index >= DIRECTIONS.size
    true
  end

  def direction
    DIRECTIONS[@direction_index]
  end

  def placed?
    @is_placed
  end

  def report
    puts "#{@x}, #{@y}, #{direction.upcase}"
  end

private
  def validate_position x, y
    (0..X_MAX).include?(x)  && (0..Y_MAX).include?(y)
  end

  def next_position_north
    [@x, @y + 1]
  end

  def next_position_south
    [@x, @y - 1]
  end

  def next_position_east
    [@x + 1, @y]
  end

  def next_position_west
    [@x - 1, @y]
  end
end
