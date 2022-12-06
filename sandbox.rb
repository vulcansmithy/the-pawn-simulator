require 'wongi-engine'
engine = Wongi::Engine.create

engine << ["Alice", :friend, "Bob"]
engine << ["Alice", :age, 35]

# this how you display the facts
engine.entity("Alice").each do |predicate, object|
  puts "Alice's #{predicate} is #{object}"
end