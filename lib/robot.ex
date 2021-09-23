defmodule Robot do
  @moduledoc """
    Represent the robot to be moved and rotated to the left / to the right
  """
  defstruct x: nil, y: nil, direction: nil

  alias Rotation

  def move_forward(%Robot{direction: "WEST", x: x} = robot) when x <= 5 and x > 0 do
    %Robot{robot | x: robot.x - 1}
  end

  def move_forward(%Robot{direction: "NORTH", y: y} = robot) when y < 5 and y >= 0 do
    %Robot{robot | y: robot.y + 1}
  end

  def move_forward(%Robot{direction: "EAST", x: x} = robot) when x < 5 and x >= 0 do
    %Robot{robot | x: robot.x + 1}
  end

  def move_forward(%Robot{direction: "SOUTH", y: y} = robot) when y <= 5 and y > 0 do
    %Robot{robot | y: robot.y - 1}
  end

  def move_forward(robot), do: robot

  def turn_left(robot), do: %Robot{robot | direction: Rotation.left()[robot.direction]}

  def turn_right(robot), do: %Robot{robot | direction: Rotation.right()[robot.direction]}

end
