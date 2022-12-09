require_relative '../models/chessboard'

class Pawn
  attr_accessor :color

  attr_accessor :placed
  alias_method :placed?, :placed

  attr_accessor :x_position
  attr_accessor :y_position
  attr_accessor :heading

  attr_accessor :can_move
  alias_method :can_move?, :can_move

  attr_accessor :first_move
  alias_method :first_move?, :first_move

  def initialize
    @color = nil
    @placed = false
    @x_position = 0
    @y_position = 0
    @heading = :north
    @can_move = false
    @first_move = true
  end  

  def place_on_the_board(x_position=0, y_position=0, heading=nil, color=nil)

    return false if x_position < 0 || x_position > 7
    return false if y_position < 0 || y_position > 7

    self.heading = heading if heading
    self.color = color unless self.color

    self.x_position = x_position
    self.y_position = y_position

    self.placed = true unless self.placed
    self.can_move = true unless self.can_move?
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

    return unless self.can_move?

    return if step > 2

    step = 1 if check_for_over_step

    if Chessboard.check_if_within_the_boarder(self)  
      case self.heading
      when :north 
        self.y_position += step
      when :east
        self.x_position += step
      when :south
        self.y_position -= step
      when :west
        self.x_position -= step
      else
        return  
      end

      self.first_move = false if self.first_move?
    end 
  end  

  def check_for_over_step
    result = nil
    result = case self.heading
    when :north 
      (self.y_position + 2) > 7
    when :east
      (self.x_position + 2) > 7
    when :south
      (self.y_position - 2) < 0
    when :west
      (self.x_position  - 2) < 0
    else
      return :unrecognized  
    end

    return result
  end  
end    