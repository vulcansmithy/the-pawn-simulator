require './sandbox'
require 'awesome_print'

# this enable this ruby script to be run from the command line
Sandbox.new.main if __FILE__ == $PROGRAM_NAME

class Sandbox

  COMMAND_DICTIONARY ||= [/EXIT/, /LEFT/, /RIGHT/, /MOVE/, /PLACE/, /REPORT/]

  def main
    while true do
      print ":: "
      raw_cmd = gets.chomp.upcase
  
      processed_cmd = self.command_processor(raw_cmd)
  
      break if processed_cmd&.first == :exit
  end
  end  

  def command_processor(cmd)
    result = nil
    processed_cmd = nil
    Sandbox::COMMAND_DICTIONARY.each do |item|
      unless (result = cmd.scan(item)).empty?
        processed_cmd = self.send("#{result.first.downcase}_command", cmd) 
        break
      end  
    end  
  
    return processed_cmd
  end 

  def exit_command(cmd)
    puts "Running exit_command..."
    return [:exit]
  end 

  def left_command(cmd)
    puts "Running left_command..."
    return [:left]
  end
  
  def right_command(cmd)
    puts "Running right_command..."
    return [:right]
  end 

  def move_command(cmd)
    puts "Running move_command..."

    return [:move]
  end  

  def place_command(cmd)
    puts "Running place_command..."
    puts "cmd='#{cmd}'"
  end

  def report_command(cmd)
    puts "Running report_command..."
    return [:move]
  end 
end  




=begin
[0-6],\s+[0-6]

NORTH|EAST|SOUTH|WEST

WHITE|BLACK

=end