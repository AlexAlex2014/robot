# frozen_string_literal: true

# Create module Move robot
module Move
  def move
    case @direct
    when 'NORTH' then @vert += 1 unless @vert >= @max_y
    when 'SOUTH' then @vert -= 1 unless @vert <= @min_y
    when 'EAST' then @hor += 1 unless @hor >= @max_x
    when 'WEST' then @hor -= 1 unless @hor <= @min_x
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
