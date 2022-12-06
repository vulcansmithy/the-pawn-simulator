require "wongi-engine"
require "awesome_print"

require_relative "pawn.rb"
require_relative "rules_engine.rb"

pawn = Pawn.new
pawn.color = "white"
pawn.place_on_the_board

rules_engine = RulesEngine.instance
rules_engine << [pawn, :placed, pawn.placed?]
rules_engine << [pawn, :color, "white"]

# ap rules_engine.entity(pawn)

# this how you display the facts
# rules_engine.entity(pawn).each do |predicate, object|
#  puts "Pawn #{predicate} is #{object}"
# end

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


