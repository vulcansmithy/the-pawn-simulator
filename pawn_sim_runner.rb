require 'optparse'
require 'awesome_print'

require './pawn_simulator'

options = {}

class Parser
  def self.parse(args)
    options = {}
    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: pawn_sim_runner.rb [options] ARG...'
      opts.separator 'A Pawn Chess Piece Simulator'
      opts.separator 'Example: ruby pawn_sim_runner.rb -fcommand_list.txt'
      
      opts.separator ''
      opts.separator 'Options:'

      opts.on('-fFILENAME', '--file=FILENAME', 'Filename of the input file') do |f|
        options[:filename] = f
      end    
      
      
      opts.separator ''
      opts.separator 'Help options:'
      
      opts.on('-h', '--help', 'Prints this help') do
        puts opts
        exit
      end
    end

    opt_parser.parse!(args)
    return options
  end
end

begin
  options = Parser.parse ARGV
rescue Exception => e
  exit 1
end

if options[:filename]
  PawnSimulator.new.main_with_file_input(options[:filename])
else
  PawnSimulator.new.main
end  


