defmodule RobotTest do
  use ExUnit.Case
  alias Robot

  test "move/1 robot one unit forward in the direction W" do
    robot = %Robot{x: 1, y: 2,direction: "WEST"} |> Robot.move_forward()
    assert robot.x == 0
    assert robot.y == 2
    assert robot.direction == "WEST"
  end

  test "move/1 robot one unit forward in the direction N" do
    robot = %Robot{x: 1, y: 0,direction: "NORTH"} |> Robot.move_forward()
    assert robot.x == 1
    assert robot.y == 1
    assert robot.direction == "NORTH"
  end

  test "move/1 robot one unit forward in the direction E" do
    robot = %Robot{x: 1, y: 2,direction: "EAST"} |> Robot.move_forward()
    assert robot.x == 2
    assert robot.y == 2
    assert robot.direction == "EAST"
  end

  test "move/1 robot one unit forward in the direction S" do
    robot = %Robot{x: 1, y: 2,direction: "SOUTH"} |> Robot.move_forward()
    assert robot.x == 1
    assert robot.y == 1
    assert robot.direction == "SOUTH"
  end

  test "move ignore command when it puts the robot out of the table on x axis" do
    robot = %Robot{x: 0, y: 1,direction: "WEST"} |> Robot.move_forward()
    assert robot.x == 0
    assert robot.y == 1
    assert robot.direction == "WEST"
  end

  test "move ignore command when it puts the robot out of the table on y axis" do
    robot = %Robot{x: 1, y: 5,direction: "NORTH"} |> Robot.move_forward()
    assert robot.x == 1
    assert robot.y == 5
    assert robot.direction == "NORTH"
  end

  test "turn_left/1 rotate the robot direction N, 90 degrees on the left" do
    robot = %Robot{x: 1, y: 5,direction: "NORTH"} |> Robot.turn_left()
    assert robot.x == 1
    assert robot.y == 5
    assert robot.direction == "WEST"
  end

  test "turn_left/1 rotate the robot direction S, 90 degrees on the left" do
    robot = %Robot{x: 1, y: 5,direction: "SOUTH"} |> Robot.turn_left()
    assert robot.x == 1
    assert robot.y == 5
    assert robot.direction == "EAST"
  end

  test "turn_right/1 rotate the robot direction N, 90 degrees on the right" do
    robot = %Robot{x: 1, y: 5,direction: "NORTH"} |> Robot.turn_right()
    assert robot.x == 1
    assert robot.y == 5
    assert robot.direction == "EAST"
  end

  test "turn_right/1 rotate the robot direction S, 90 degrees on the right" do
    robot = %Robot{x: 1, y: 5,direction: "SOUTH"} |> Robot.turn_right()
    assert robot.x == 1
    assert robot.y == 5
    assert robot.direction == "WEST"
  end
end
