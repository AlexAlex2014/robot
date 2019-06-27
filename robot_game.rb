# frozen_string_literal: true

# Create the main class
class RobotGame
  def initialize(max_x = 5, max_y = 6, x = 0, y = 0, f = 'NORTH')
    @max_x = max_x
    @max_y = max_y
    @min_x = 0
    @min_y = 0
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
    puts 'Enter the table size, default X = 5, Y = 6'

    loop do
      puts 'Enter the operation X'
      var_x = gets.chomp
      break if var_x.empty?

      if var_x.is_a?(String)
        varx_int = var_x.to_i
        if varx_int != 0
          @max_x = varx_int
          break
        end
      end
    end
    loop do
      puts 'Enter the operation Y'
      var_y = gets.chomp
      break if var_y.empty?

      if var_y.is_a?(String)
        vary_int = var_y.to_i
        if vary_int != 0
          @max_y = vary_int
          break
        end
      end
    end

    run
  end

  def run
    loop do
      puts "Enter the operation: 'place', 'move', 'left', 'right' or 'report'."
      puts "First command must be 'place'"

      input = gets.chomp
      oper_f = input.split(' ')
      operation = oper_f[0]
      case operation
      when 'place'
        @qqq = true
        unless oper_f[1].nil?
          oper_s = oper_f[1].split(',')
          @x = oper_s[0].to_i
          @y = oper_s[1].to_i
          @f = oper_s[2]
          place
        end
      when 'move'
        move if @qqq
      when 'left'
        left if @qqq
      when 'right'
        right if @qqq
      when 'report'
        report if @qqq
      else puts 'Invalid commands entered. Enter the correct commands.'
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
