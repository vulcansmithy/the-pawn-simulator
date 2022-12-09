require './sandbox'
require 'awesome_print'

# this enable this ruby script to be run from the command line
Sandbox.new.main if __FILE__ == $PROGRAM_NAME

class Sandbox

  COMMAND_DICTIONARY = [/EXIT/, /LEFT/, /RIGHT/, /MOVE/, /PLACE/, /REPORT/]

  def main
    while true do
      print ":: "
      raw_cmd = gets.chomp.upcase
  
      processed_cmd = self.command_processor(raw_cmd)
      puts "\"#{processed_cmd}\"" if processed_cmd != nil
  
      exit if processed_cmd == "EXIT"
  end
  end  

  def command_processor(cmd)
    result = nil
    processed_cmd = nil
    Sandbox::COMMAND_DICTIONARY.each do |item|
      unless (result = cmd.scan(item)).empty?
        processed_cmd = result.first
        break
      end  
    end  
  
    return processed_cmd
  end 

end  




=begin
[0-6],\s+[0-6]

NORTH|EAST|SOUTH|WEST

WHITE|BLACK

=end