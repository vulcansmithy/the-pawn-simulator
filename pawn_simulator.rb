require './pawn_simulator'
require_relative './models/pawn'
require_relative './models/chessboard'
require 'awesome_print'

# this enable this ruby script to be run from the command line
PawnSimulator.new.main if __FILE__ == $PROGRAM_NAME

class PawnSimulator

  COMMAND_DICTIONARY ||= [/EXIT/, /LEFT/, /RIGHT/, /MOVE/, /PLACE/, /REPORT/]

  def main

    pawn = Pawn.new
    chessboard = Chessboard.new

    while true do
      print ">> "
      raw_cmd = gets.chomp.upcase
  
      processed_cmd = self.command_processor(raw_cmd)   
      case processed_cmd&.first
      when :exit 
        puts "Exiting..."
        break

      when :left
        pawn.turn_left

      when :right
        pawn.turn_right

      when :move
        pawn.move(processed_cmd[1])

      when :place
        x_position = processed_cmd[1][0]
        y_position = processed_cmd[1][1]
        heading    = processed_cmd[2]
        color      = processed_cmd[3]
        pawn.place_on_the_board(x_position, y_position, heading,  color)

      when :report
        pawn.report 

      else  
        puts "Error: Unrecognized command..."
      end  
    end
  end  

  def command_processor(cmd)
    result = nil
    processed_cmd = []
    PawnSimulator::COMMAND_DICTIONARY.each do |item|
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
 
    return result
  end  

  def place_command(cmd)
    result   = []
    position = cmd.scan(/[0-7],[0-7]/)
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