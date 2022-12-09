require_relative '../../models/chessboard'
require_relative '../../models/pawn'

require 'awesome_print'

RSpec.describe "Chessboard", type: :model do
  describe "border check" do
    it "should not move forward if the heading is north and at the north border" do
      pawn = Pawn.new
      pawn.place_on_the_board(rand(0..7), 7, :north, :white)
      pawn.move
      expect(pawn.y_position).to eq 7
    end 

    it "should not move forward if the heading is east and at the east border" do
      pawn = Pawn.new
      pawn.place_on_the_board(7, rand(0..7), :east, :white)
      pawn.move
      expect(pawn.x_position).to eq 7
    end

    it "should not move forward if the heading is south and at the south border" do
      pawn = Pawn.new
      pawn.place_on_the_board(rand(0..7), 0, :south, :white)
      pawn.move
      expect(pawn.y_position).to eq 0
    end  

    it "should not move forward if the heading is west and at the west border" do
      pawn = Pawn.new
      pawn.place_on_the_board(0, rand(0..7), :west, :white)
      pawn.move
      expect(pawn.x_position).to eq 0
    end 
  end
end