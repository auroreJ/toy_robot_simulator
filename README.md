# ToyRobotSimulator

**The application is a simulation of a toy robot moving on a square tabletop, of
  dimensions 5 units x 5 units.
  ● There are no other obstructions on the table surface.
  ● The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.
  Create an application that can read in commands of the following form:
  PLACE X,Y,F
  MOVE
  LEFT
  RIGHT
  REPORT
  
  ● PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
  ● The origin (0,0) can be considered to be the SOUTH WEST most corner.
  ● The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another
  PLACE command. The application should discard all commands in the
  sequence until a valid PLACE command has been executed.
  ● MOVE will move the toy robot one unit forward in the direction it is currently
  facing.
  ● LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
  ● REPORT will announce the X,Y and F of the robot. This can be in any form,
  but standard output is sufficient.
  ● A robot that is not on the table can choose the ignore the MOVE, LEFT,
  RIGHT and REPORT commands.
  ● Input can be from a file, or from standard input, as the developer chooses.
  ● Provide test data to exercise the application.
  Constraints
  
  ● The toy robot must not fall off the table during movement. This also includes
  the initial placement of the toy robot.
  ● Any move that would cause the robot to fall must be ignored.**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `toy_robot_simulator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:toy_robot_simulator, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/toy_robot_simulator](https://hexdocs.pm/toy_robot_simulator).




Elixir can be installed following the link below:
https://elixir-lang.org/install.html

Once elixir is installed, the application can be run writing the following command into a terminal:

`iex -S mix`

Test data are available via 5 files: 

`"example_a.txt"`, 

`"example_b.txt"`, 

`"example_c.txt"`, 

`place_out_of_table.txt`, 

`waiting_a_valid_place.txt`

Then write:

`iex(1)> ToyRobotSimulator.run("example_a.txt")`

`iex(2)> ToyRobotSimulator.run("example_b.txt")`

`iex(3)> ToyRobotSimulator.run("example_c.txt")`



`place_out_of_table.txt` and `waiting_a_valid_place.txt` are inside the test section of the application, so for running them, the steps are different:

To run them (in the terminal):

`$ mix test test/toy_robot_simulator_test.exs:26`

`$ mix test test/toy_robot_simulator_test.exs:30`