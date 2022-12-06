require "wongi-engine"
require_relative 'rulesets/board_ruleset'

require "awesome_print"

require_relative "pawn"



pawn = Pawn.new
pawn.color = "white"
pawn.place_on_the_board

# initialize the wongi engine
ENGINE = Wongi::Engine.create
ENGINE << [pawn, :placed, pawn.placed?]
ENGINE << [pawn, :color, "white"]


ENGINE << build_board_ruleset

# ap rules_engine.entity(pawn)

# this how you display the facts
# rules_engine.entity(pawn).each do |predicate, object|
#  puts "Pawn #{predicate} is #{object}"
# end

=begin
rules_engine.rule "Pawn cannot move unless it is placed in the board" do
  forall {
    has :A, :placed, :B

    assert { |token|
      token[:B]
    }
  }
  make {
    action { |token|
      puts "****"
      token[:A].can_move = true unless token[:A].can_move? 
    }
  }
end
=end


