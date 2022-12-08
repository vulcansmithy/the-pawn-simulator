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
          puts "**** 1"
          token[:A].can_move = true unless token[:A].can_move? 
        }
      }
    end

    rule "Pawn can move unless they are at the border of the board" do
      forall {
        has :A, :set_row_to, :B

        less :A, 7
      }

      make {
        action { |token|
          puts "**** 2"

          ap token[:B].position[1]
          ap token[:B]
        }
      }
    end  
  end  
end    