require "wongi-engine"
require_relative 'rulesets/board_ruleset'

# model
require_relative "pawn"

# debugging
require "awesome_print"

include Wongi::Engine::DSL

pawn = Pawn.new
pawn.color = "white"
pawn.place_on_the_board

# initialize the wongi engine
ENGINE = Wongi::Engine.create
ENGINE << build_board_ruleset

# load the facts
ENGINE << [pawn, :placed, pawn.placed?]
ENGINE << [pawn, :color, "white"]


# ap rules_engine.entity(pawn)

# this how you display the facts
# rules_engine.entity(pawn).each do |predicate, object|
#  puts "Pawn #{predicate} is #{object}"
# end

