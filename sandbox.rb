require "wongi-engine"
require "awesome_print"

require_relative "pawn.rb"
require_relative "rules_engine.rb"

puts "1:08pm"
pawn = Pawn.new
pawn.color = "white"
pawn.placed = true


rules_engine = RulesEngine.instance
rules_engine << [pawn, :placed, true]
rules_engine << [pawn, :color, "white"]

ap rules_engine.entity(pawn)

# this how you display the facts
rules_engine.entity(pawn).each do |predicate, object|
  puts "Pawn #{predicate} is #{object}"
end

pawn_placed_rule = rules_engine.rule "Pawn placed onto board" do
  forall {
    has :A, :placed, :B
  }
  make {
    action { |token|
      puts "%s and %s" % [ token[:A], token[:B] ]
    }
  }
end


