
require_relative "models/pawn"

# debugging
require "awesome_print"

pawn = Pawn.new
pawn.color = "white"
pawn.place_on_the_board


pawn.turn_right # should be :east
#ap pawn


pawn.turn_right # should be :south
#ap pawn

pawn.turn_right # should be :west
# ap pawn

pawn.turn_right # should be :north
ap pawn
