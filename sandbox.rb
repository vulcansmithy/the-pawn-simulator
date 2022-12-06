require "wongi-engine"
require "awesome_print"

require_relative "pawn.rb"

engine = Wongi::Engine.create

engine << ["Alice", :friend, "Bob"]
engine << ["Alice", :age, 35]

ap engine.entity("Alice")

# this how you display the facts
engine.entity("Alice").each do |predicate, object|
  puts "Alice's #{predicate} is #{object}"
end

pawn = Pawn.new
ap pawn.placed = true
ap pawn