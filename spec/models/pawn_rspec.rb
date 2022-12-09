
require 'awesome_print'

require_relative '../../models/pawn'

RSpec.describe "Pawn", type: :model do
  describe "heading" do
    it "should default to :north when initially iniated" do
      expect(Pawn.new.heading).to eq :north
    end

    it "should able to turn right" do
      pawn = Pawn.new
      expect(pawn.turn_right).to eq :east
      expect(pawn.turn_right).to eq :south
      expect(pawn.turn_right).to eq :west
      expect(pawn.turn_right).to eq :north
    end  

    it "should able to turn left" do
      pawn = Pawn.new
      expect(pawn.turn_left).to eq :west
      expect(pawn.turn_left).to eq :south
      expect(pawn.turn_left).to eq :east
      expect(pawn.turn_left).to eq :north
    end 
    
    it "should able to  turn left and right" do
      pawn = Pawn.new
      pawn.turn_left
      pawn.turn_right
      expect(pawn.heading).to eq :north

      pawn.turn_right
      pawn.turn_right
      pawn.turn_left
      expect(pawn.heading).to eq :east
    end  

    it "should check for overstep" do
      pawn = Pawn.new
      pawn.place_on_the_board(rand(0..7), 6, :north, :white)
      pawn.move(2)

      expect(pawn.y_position).to eq 7

      pawn = Pawn.new
      pawn.place_on_the_board(6, rand(0..7), :east, :white)
      pawn.move(2)

      expect(pawn.x_position).to eq 7

      pawn = Pawn.new
      pawn.place_on_the_board(rand(0..7), 1, :south, :white)
      pawn.move(2)

      expect(pawn.y_position).to eq 0

      pawn = Pawn.new
      pawn.place_on_the_board(1, rand(0..7), :west, :white)
      pawn.move(2)

      expect(pawn.x_position).to eq 0
    end  
  end
end