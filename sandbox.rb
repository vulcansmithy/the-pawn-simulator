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
      puts "#{processed_cmd.inspect}"
  
      break if processed_cmd&.first == :exit
  end
  end  

  def command_processor(cmd)
    result = nil
    processed_cmd = []
    Sandbox::COMMAND_DICTIONARY.each do |item|
      unless (result = cmd.scan(item)).empty?
        processed_cmd = self.send("#{result.first.downcase}_command", cmd) 
        break
      end  
    end  
  
    return processed_cmd
  end 

  def exit_command(cmd)
    return [:exit]
  end 

  def left_command(cmd)
    return [:left]
  end
  
  def right_command(cmd)
    return [:right]
  end 

  def move_command(cmd)
    result = nil

    if cmd.gsub(/MOVE/, '').empty?
      result = [:move, 1]
    else
      buf = nil
      if (buf = cmd.scan(/1|2/)).empty? 
        result = [] 
      else
        result = [:move, buf.first.to_i] 
      end
    end  
    puts "result=#{result}" unless result.empty?

    return result
  end  

  def place_command(cmd)
    result   = []
    position = cmd.scan(/[0-6],[0-6]/)
    heading  = cmd.scan(/NORTH|EAST|SOUTH|WEST/)
    color    = cmd.scan(/WHITE|BLACK/)

    if !position.empty? && !heading.empty? && !color.empty?
      result.push(:place)
      result.push(position.first.split(",").map(&:to_i))
      result.push(heading.first.downcase.to_sym)
      result.push(color.first.downcase.to_sym)
    end  

    return result
  end

  def report_command(cmd)
    return [:report]
  end 
end  