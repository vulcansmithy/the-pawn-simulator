require "wongi-engine"
require "awesome_print"

require_relative "pawn.rb"
require_relative "rules_engine.rb"

puts "1:08pm"
pawn = Pawn.new
ap pawn.placed = true
ap pawn

rules_engine = RulesEngine.instance
rules_engine << ["Alice", :friend, "Bob"]
rules_engine << ["Alice", :age, 35]

ap rules_engine.entity("Alice")

# this how you display the facts
rules_engine.entity("Alice").each do |predicate, object|
  puts "Alice's #{predicate} is #{object}"
end