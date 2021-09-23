defmodule Rotation do
  @moduledoc """
  Present two maps of rotations
  """

  def left() do
    %{"NORTH" => "WEST", "SOUTH" => "EAST", "WEST" => "SOUTH", "EAST" => "NORTH"}
  end

  def right() do
    %{"NORTH" => "EAST", "SOUTH" => "WEST", "WEST" => "NORTH", "EAST" => "SOUTH"}
  end
end
