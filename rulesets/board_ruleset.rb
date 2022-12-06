require "wongi-engine"

include Wongi::Engine

def build_board_ruleset
 ruleset 'board_ruleset' do
    rule "Pawn cannot move unless it is placed in the board" do
      forall {
        has :A, :placed, :B
    
        assert { |token|
          token[:B]
        }
      }
      make {
        action { |token|
          puts "****"
          token[:A].can_move = true unless token[:A].can_move? 
        }
      }
    end
  end  
end    