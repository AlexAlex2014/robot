# frozen_string_literal: true

# Create module Move robot
module Move
  def check_direction_north
    @vert += 1 unless @vert >= @max_y
  end

  def check_direction_south
    @vert -= 1 unless @vert <= @min_y
  end

  def check_direction_east
    @hor += 1 unless @hor >= @max_x
  end

  def check_direction_west
    @hor -= 1 unless @hor <= @min_x
  end

  def move
    case @direct
    when 'NORTH' then check_direction_north
    when 'SOUTH' then check_direction_south
    when 'EAST' then check_direction_east
    when 'WEST' then check_direction_west
    end
  end

  def left
    @direct =
      case @direct
      when 'NORTH' then @direction[3]
      when 'WEST' then @direction[2]
      when 'SOUTH' then @direction[1]
      when 'EAST' then @direction[0]
      end
  end

  def right
    @direct =
      case @direct
      when 'NORTH' then @direction[1]
      when 'WEST' then @direction[0]
      when 'SOUTH' then @direction[3]
      when 'EAST' then @direction[2]
      end
  end
end
