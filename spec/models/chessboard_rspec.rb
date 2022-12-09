require 'awesome_print'

require_relative '../../models/chessboard'
require_relative '../../models/pawn'

RSpec.describe "Chessboard", type: :model do
  describe "border check" do
    it "should check if on the border" do
      pawn = Pawn.new
      pawn.heading = :south
      expect( Chessboard.check_if_within_the_boarder(pawn)).to eq true
    end

    it "should not move forward if the heading is north and at the north border" do
      pawn = Pawn.new
      pawn.place_on_the_board(rand(0..7), 7, :north, :white)
      expect(pawn.move).to eq false
    end 

    it "should not move forward if the heading is east and at the east border" do
      pawn = Pawn.new
      pawn.place_on_the_board(7, rand(0..7), :east, :white)
      expect(pawn.move).to eq false
    end

    it "should not move forward if the heading is south and at the south border" do
      pawn = Pawn.new
      pawn.place_on_the_board(rand(0..7), 0, :south, :white)
      expect(pawn.move).to eq false
    end  

    it "should not move forward if the heading is west and at the west border" do
      pawn = Pawn.new
      pawn.place_on_the_board(0, rand(0..7), :west, :white)
      expect(pawn.move).to eq false
    end 
  end
end