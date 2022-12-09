
require_relative "models/pawn"

# debugging
require "awesome_print"

def command_processor(cmd)
  result = nil
  processed_cmd = nil

  if (result = cmd.scan(/EXIT/)).empty? == false
    processed_cmd = result.first
  elsif (result = cmd.scan(/LEFT/)).empty? == false
    processed_cmd = result.first
  elsif (result = cmd.scan(/MOVE/)).empty? == false
    processed_cmd = result.first
  elsif (result = cmd.scan(/PLACE/)).empty? == false   
    processed_cmd = result.first
  elsif (result = cmd.scan(/REPORT/)).empty? == false 
    processed_cmd = result.first
  elsif (result = cmd.scan(/RIGHT/)).empty? == false  
    processed_cmd = result.first 
  end
  
  return processed_cmd 
end    


while true do
    print ">> "
    cmd = gets.chomp.upcase

    processed_cmd = command_processor(cmd)
    puts "\"#{processed_cmd}\"" if processed_cmd != nil

    exit if processed_cmd == "EXIT"
end
