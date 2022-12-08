
require_relative "models/pawn"

# debugging
require "awesome_print"

pawn = Pawn.new
pawn.color = "white"
pawn.place_on_the_board


pawn.turn_right # should be :east
pawn.turn_right # should be :south
pawn.turn_right # should be :west
pawn.turn_right # should be :north

pawn.turn_left
pawn.turn_left
pawn.turn_left
pawn.turn_left
ap pawn

