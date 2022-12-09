
require_relative '../../models/chessboard'
require_relative '../../models/pawn'

RSpec.describe "Chessboard", type: :model do
  describe "border check" do
    it "should check if on the border" do

      pawn = Pawn.new
      pawn.heading = :south
     expect( Chessboard.check_if_on_the_boarder(pawn)).to eq true
    end

    it "should not move forward if the heading is north and at the north border" do
      pawn = Pawn.new
      pawn.heading = :north
      pawn.x_position = rand(0..7)
      pawn.y_position = 7
     expect(pawn.move).to eq false
    end 

    it "should not move forward if the heading is east and at the east border" do
      pawn = Pawn.new
      pawn.heading = :east
      pawn.x_position = 7
      pawn.y_position = rand(0..7)
     expect(pawn.move).to eq false
    end

    it "should not move forward if the heading is south and at the south border" do
      pawn = Pawn.new
      pawn.heading = :south
      pawn.x_position = rand(0..7)
      pawn.y_position = 0
     expect(pawn.move).to eq false
    end  

    it "should not move forward if the heading is west and at the west border" do
      pawn = Pawn.new
      pawn.heading = :west
      pawn.x_position = 0
      pawn.y_position = rand(0..7)
     expect(pawn.move).to eq false
    end 
  end
end