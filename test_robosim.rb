require './robot.rb'
require 'test/unit'

class TestRoboSim < Test::Unit::TestCase
  def testBoard
    board = Board.new(5,6)
    assert_equal(5, board.length)
    assert_equal(6, board.width)
  end

  def testRobot
    robot = Robot.new
    assert_equal(0, robot.curr_pos_x)
    assert_equal(0, robot.curr_pos_x)
    assert_equal(nil, robot.curr_dir)
  end

  def testRobotValidPlacement
    robot = Robot.new
    board = Board.new(5,5)
    assert_equal(true, robot.place(2,2,'N',board))
  end

  def testRobotOutOfBoundPlacement
    robot = Robot.new
    board = Board.new(5,5)
    assert_equal(false, robot.place(7,7,'N',board))
  end

  def testRobotDirectionChange
    robot = Robot.new
    board = Board.new(5,5)
    assert_equal(true, robot.place(2,2,'N',board))
    assert_equal('W', robot.left)
    assert_equal('S', robot.left)
    assert_equal('E', robot.left)
    assert_equal('N', robot.left)
    assert_equal('E', robot.right)
    assert_equal('S', robot.right)
    assert_equal('W', robot.right)
    assert_equal('N', robot.right)
  end

  def testRobotValidMove
    robot = Robot.new
    board = Board.new(5,5)
    assert_equal(true, robot.place(0,0,'N',board))
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :==, 4)
    assert_equal('E', robot.right) #Turn right
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :==, 4)
    assert_equal('S', robot.right) #Turn right
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :==, 0)
    assert_equal('W', robot.right) #Turn right
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :==, 0)
    assert_equal('N', robot.right) #Turn right
    #at this stage Robot should be back to it's original position of 0,0,NORTH
    assert_equal('0,0,NORTH', robot.currentPosition)
  end

  def testRobotinvalidMove
    robot = Robot.new
    board = Board.new(5,5)
    assert_equal(true, robot.place(0,0,'N',board))
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :>, 0)
    assert_operator(robot.move(board), :==, 4)
    assert_equal(nil, robot.move(board))
  end

  def testRobotReport
    robot = Robot.new
    board = Board.new(5,5)
    assert_equal('Robot is not placed on the board yet.', robot.currentPosition)
    assert_equal(true, robot.place(0,0,'N',board))
    assert_equal('0,0,NORTH', robot.currentPosition)
    assert_equal(true, robot.place(2,2,'N',board))
    assert_equal('E', robot.right)
    assert_operator(robot.move(board), :>, 0)
    assert_equal('3,2,EAST', robot.currentPosition)
  end
end
