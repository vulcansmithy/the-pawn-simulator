class Pawn
  attr_accessor :color

  attr_accessor :placed
  alias_method :placed?, :placed

  attr_accessor :position
  attr_accessor :y_position
  attr_accessor :facing

  attr_accessor :can_move
  alias_method :can_move?, :can_move


  def initialize
    @color = nil
    @placed = false
    @position = [0, 7]
    @y_position = 4
    @facing = :north
    @can_move = false
  end  

  def place_on_the_board
    @placed = true
    @can_move = true
  end  

  def remove_from_the_board
    @placed = false
    @can_move = false
  end  
end    