class Pawn
  attr_accessor :color

  attr_accessor :placed
  alias_method :placed?, :placed

  attr_accessor :x_position
  attr_accessor :y_position

  attr_accessor :facing


  def initialize
    @color = nil
    @placed = false
    @x_position = 0
    @y_position = 0
    @facing = :north
  end  
end    