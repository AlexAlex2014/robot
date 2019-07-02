# frozen_string_literal: true

require_relative 'move'

# Create the main class
class RobotGame
  include Move
  def initialize(max_x = 5, max_y = 6, hor = 0, vert = 0, direct = 'NORTH')
    @max_x = max_x
    @max_y = max_y
    @min_x = 0
    @min_y = 0
    @hor = hor
    @vert = vert
    @direct = direct
    @arr_place = [hor, vert, direct]
    @direction = %w[NORTH EAST SOUTH WEST]
    @qqq = false
  end

  def place
    p @arr_place = [@hor, @vert, @direct]
  end

  def table_size_x
    loop do
      puts 'Enter the operation X'
      var_x = gets.chomp
      break if var_x.empty?

      if var_x.is_a?(String)
        varx_int = var_x.to_i
        break @max_x = varx_int if varx_int != 0
      end
    end
  end

  def table_size_y
    loop do
      puts 'Enter the operation Y'
      var_y = gets.chomp
      break if var_y.empty?

      if var_y.is_a?(String)
        vary_int = var_y.to_i
        break @max_y = vary_int if vary_int != 0
      end
    end
  end

  def table_size
    puts 'Enter the table size, default X = 5, Y = 6'
    table_size_x
    table_size_y
    console
  end

  def console
    loop do
      puts "Enter command:'place'(First com.),'move','left','right','report'"
      input_str = gets.chomp.split(' ')
      run(input_str)
      commands(input_str) if @qqq && input_str[0] != 'place'
    end
  end

  def run_console(oper_s)
    @qqq = true
    return if oper_s[1].nil?

    oper_s = oper_s[1].split(',')
    @hor = oper_s[0].to_i
    @vert = oper_s[1].to_i
    @direct = oper_s[2]
    place
  end

  def run(input)
    case input[0]
    when 'place' then run_console(input)
    end
  end

  def commands(input_com)
    case input_com[0]
    when 'move' then move
    when 'left' then left
    when 'right' then right
    when 'report' then report
    else puts 'Invalid commands entered. Enter the correct commands.'
    end
  end

  def report
    place
  end
end
