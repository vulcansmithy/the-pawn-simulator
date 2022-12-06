require "wongi-engine"
require "awesome_print"

engine = Wongi::Engine.create

engine << ["Alice", :friend, "Bob"]
engine << ["Alice", :age, 35]

ap engine.entity("Alice")

# this how you display the facts
engine.entity("Alice").each do |predicate, object|
  puts "Alice's #{predicate} is #{object}"
end