class Chessboard
  def initialize
  end  

  def self.check_if_on_the_boarder(x_position, y_position, heading)
    return case heading
      when :north 
        y_position == 7
      when :east
        x_position == 7
      when :south
        y_position == 0
      when :west
        x_position == 0
      else
        false  
      end
  end


  def self.check_if_within_the_boarder(x_position, y_position, heading)
    return case heading
      when :north 
        y_position <= 7
      when :east
        x_position <= 7
      when :south
        y_position >= 0
      when :west
        x_position >= 0
      else
        false  
      end
  end  
end    