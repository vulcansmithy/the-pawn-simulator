
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
  end
end