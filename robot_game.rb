class RobotGame
  def initialize(x = 5, y = 6, f = 'NORTH')
    @x = x
    @y = y
    @f = f
    @arr_place = [x, y, f]
    @direction = ['NORTH', 'SOUTH', 'EAST', 'WEST']
  end

  def place(x = 0, y = 0, f = 'NORTH')
  #  @arr_place = [x, y, f]
  end

  def move
    if
    @arr_place
  end

  def left

  end

  def right

  end

  def report
    p @arr_place

  end
end

robot = RobotGame.new

robot.move
robot.report