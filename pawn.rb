class Pawn
  attr_accessor :color

  attr_accessor :placed
  alias_method :placed?, :placed

  attr_accessor :x_position
  attr_accessor :y_position

  attr_accessor :facing

  attr_accessor :can_move
  alias_method :can_move?, :can_move


  def initialize
    @color = nil
    @placed = false
    @x_position = 0
    @y_position = 0
    @facing = :north
    @can_move = false
  end  

  def place_on_the_board
    @placed = true
  end  

  def remove_from_the_board
    @placed = false
  end  
end    