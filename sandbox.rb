
require_relative "models/pawn"

# debugging
require "awesome_print"

def command_processor(cmd)
  result = nil
  processed_cmd = nil
  [
    /EXIT/,
    /LEFT/,
    /MOVE/,
    /PLACE/,
    /REPORT/,
    /RIGHT/
  ].each do |recognized_command|
    unless (result = cmd.scan(recognized_command)).empty?
      processed_cmd = result.first
      break
    end  
  end  

  return processed_cmd
end    


while true do
    print ":: "
    raw_cmd = gets.chomp.upcase

    processed_cmd = command_processor(raw_cmd)
    puts "\"#{processed_cmd}\"" if processed_cmd != nil

    exit if processed_cmd == "EXIT"
end
