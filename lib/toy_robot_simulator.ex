defmodule ToyRobotSimulator do
  alias Robot

  @moduledoc """
  Represents the ToyRobotSimulator.
  Take a file of commands to execute
  """

  @x_dimensions 0..5
  @y_dimensions 0..5
  @authorized_direction ["NORTH", "WEST", "SOUTH", "EAST"]

  def run(file) do
    file = File.open!(file, [:read, "UTF-8"])

    file |> execute_commands(%Robot{})

    File.close(file)
  end

  def execute_commands(_file, nil) do
    :ok
  end

  def execute_commands(file, robot) do
    robot = read_command(file)
            |> String.split()
            |> execute_instruction(robot)

    execute_commands(file, robot)
  end

  defp read_command(file) do
    file
    |> IO.read(:line)
    |> trim_line()
  end

  defp trim_line(:eof), do: ""
  defp trim_line(line), do: String.trim(line)

  def execute_instruction(["PLACE", position], robot) do
    [x, y, direction] = String.split(position, ",")
    position = %{x: String.to_integer(x), y: String.to_integer(y)}
    with {:ok, %{x: x, y: y}} <- position_inside_the_table?(position),
         {:ok, direction} <- validate_direction(direction) do
      %Robot{x: x, y: y, direction: direction}
    else {:error, _error} -> robot
    end
  end

  def execute_instruction(["MOVE"], robot) do
    Robot.move_forward(robot)
  end

  def execute_instruction(["LEFT"], robot) do
    Robot.turn_left(robot)
  end

  def execute_instruction(["RIGHT"], robot) do
    Robot.turn_right(robot)
  end

  def execute_instruction(["REPORT"], robot) do
    IO.puts "#{robot.x},#{robot.y},#{robot.direction}"
  end

  def execute_instruction([_unknown], robot), do: robot

  def execute_instruction([], _robot), do: nil

  defp position_inside_the_table?(%{x: x, y: y} = position) when x in @x_dimensions and y in @y_dimensions do
    {:ok, position}
  end

  defp position_inside_the_table?(_position) do
    {:error, :dimensions_out_of_table}
  end

  defp validate_direction(direction) when direction in @authorized_direction do
    {:ok, direction}
  end

  defp validate_direction(_direction) do
    {:error, :unknown_direction}
  end
end