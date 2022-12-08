
require_relative '../../models/pawn'

RSpec.describe "Pawn", type: :model do
  describe "heading" do
    it "should default to :north when initially iniated" do
      expect(Pawn.new.heading).to eq :north
    end
  end
end