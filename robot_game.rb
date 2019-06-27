class RobotGame
  def initialize(max_x = 5, max_y = 6, min_x = 0, min_y = 0, x = 0, y = 0, f = 'NORTH')
    @max_x = max_x
    @max_y = max_y
    @min_x = min_x
    @min_y = min_y
    @x = x
    @y = y
    @f = f
    @arr_place = [x, y, f]
    @direction = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    @qqq = false
  end

  def place
    p @arr_place = [@x, @y, @f]
  end

  def table_size
    puts "Enter the table size, default X = 5, Y = 6"

    loop do
      puts "Enter the operation X"
      varX = gets.chomp
      if varX.empty?
        break
      elsif varX.kind_of?(String)
        varX_int = varX.to_i
        if varX_int != 0
          @max_x = varX_int
          break
        end
      end
    end
    loop do
      puts "Enter the operation Y"
      varY = gets.chomp
      if varY.empty?
        break
      elsif varY.kind_of?(String)
        varY_int = varY.to_i
        if varY_int != 0
          @max_y = varY_int
          break
        end
      end
    end

    run
  end

  def run
    loop do
      puts "Enter the operation: 'place', 'move', 'left', 'right' or 'report'. First command must be 'place'"
      input = gets.chomp
      oper_1 = input.split(' ')
      operation = oper_1[0]
      case operation
      when 'place'
        @qqq = true
        if oper_1[1] != nil
          oper_2 = oper_1[1].split(',')
          @x = oper_2[0].to_i
          @y = oper_2[1].to_i
          @f = oper_2[2]
          place
        end
      when 'move'
        if @qqq
          move
        end
      when 'left'
        if @qqq
          left
        end
      when 'right'
        if @qqq
          right
        end
      when 'report'
        if @qqq
          report
        end
      else puts "Invalid commands entered. Enter the correct commands."
      end
    end
  end

  def move
    if @f == 'NORTH'
      @y += 1 unless @y >= @max_y
    elsif @f == 'SOUTH'
      @y -= 1 unless @y <= @min_y
    elsif @f == 'EAST'
      @x += 1 unless @x >= @max_x
    elsif @f == 'WEST'
      @x -= 1 unless @x <= @min_x
    end
  end

  def left
    if @f == 'NORTH'
      @f = @direction[3]
    elsif @f == 'WEST'
      @f = @direction[2]
    elsif @f == 'SOUTH'
      @f = @direction[1]
    elsif @f == 'EAST'
      @f = @direction[0]
    end
  end

  def right
    if @f == 'NORTH'
      @f = @direction[1]
    elsif @f == 'WEST'
      @f = @direction[0]
    elsif @f == 'SOUTH'
      @f = @direction[3]
    elsif @f == 'EAST'
      @f = @direction[2]
    end
  end

  def report
    place
  end
end
