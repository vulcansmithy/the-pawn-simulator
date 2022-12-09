class Chessboard
  def initialize
  end  

  def self.check_if_within_the_boarder(chess_piece)
    return case chess_piece.heading
      when :north 
        chess_piece.y_position <= 7
      when :east
        chess_piece.x_position <= 7
      when :south
        chess_piece.y_position >= 0
      when :west
        chess_piece.x_position >= 0
      else
        false  
      end
  end
end    