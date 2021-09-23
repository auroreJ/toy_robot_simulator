defmodule ToyRobotSimulatorTest do
  use ExUnit.Case
  alias ToyRobotSimulator

  test "execute_instruction/2 PLACE robot on the table" do
    %Robot{x: 0, y: 2, direction: "NORTH"} = ToyRobotSimulator.execute_instruction(["PLACE", "0,2,NORTH"], %Robot{})
  end

  test "execute_instruction/2 ignore PLACE instruction when position is out of the table's dimensions" do
    %Robot{x: nil, y: nil, direction: nil} = ToyRobotSimulator.execute_instruction(["PLACE", "-1,6,NORTH"], %Robot{})
  end

  test "execute_instruction/2 ignore PLACE instruction when the direction is not valid" do
    %Robot{x: nil, y: nil, direction: nil} = ToyRobotSimulator.execute_instruction(["PLACE", "2,1,UNKNOWN"], %Robot{})
  end

  test "execute_instruction/2 REPORT the robot's position by inspecting it's current position" do
    robot = %Robot{x: 3, y: 5, direction: "SOUTH"}
    ToyRobotSimulator.execute_instruction(["REPORT"], robot)
  end

  test "execute_instruction/2 ignore unknown command" do
    %Robot{x: nil, y: nil, direction: nil} = ToyRobotSimulator.execute_instruction(["UNKNOWN_COMMAND"], %Robot{})
  end

  test "should discard all commands in the sequence until a valid PLACE command has been executed." do
    ToyRobotSimulator.run("test/test_file/waiting_a_valid_place.txt")
  end

  test "should ignore when the command places the robot out of the table" do
    ToyRobotSimulator.run("test/test_file/place_out_of_table.txt")
  end
end
