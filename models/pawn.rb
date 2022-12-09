class Pawn
  attr_accessor :color

  attr_accessor :placed
  alias_method :placed?, :placed

  attr_accessor :x_position
  attr_accessor :y_position
  attr_accessor :heading

  attr_accessor :can_move
  alias_method :can_move?, :can_move


  def initialize
    @color = nil
    @placed = false
    @x_position = 0
    @y_position = 0
    @heading = :north
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

  def turn_right
    case self.heading
    when :north 
      self.heading = :east
    when :east
      self.heading = :south
    when :south
      self.heading = :west
    when :west
      self.heading = :north  
    end
    
    return self.heading
  end 

  def turn_left
    case self.heading
    when :north
      self.heading = :west
    when :west
      self.heading = :south
    when :south
      self.heading = :east
    when :east
      self.heading = :north      
    end  

    return self.heading
  end  

  def move(step=1)
    # @TODO implement validation of move
    return false if step >= 2

    unless Chessboard.check_if_on_the_boarder(self)  
      return case self.heading
      when :north 
        self.y_position += 1
      when :east
        self.x_position += 1
      when :south
        self.y_position -= 1
      when :west
        self.x_position -= 1
      else
        return :unrecognized  
      end
    else
      return false  
    end  
  end  
end    