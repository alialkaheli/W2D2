# require_relative 'board.rb'


class Piece 
  attr_reader :symbol
  
  def initialize(grid_pos, board, symbol)
    @pos = grid_pos
    @board = board
    @symbol = symbol
  end
  
  def moves
    # return []
  end
  
end

class NullPiece < Piece
  
end 
#########
=begin
class Bishop < Piece
  include SlidingPiece
  
  def move_dirs(curr_pos)
  end 
end 

class Rook < Piece
  include SlidingPiece
  
  def move_dirs(curr_pos)
  end 
end 

class Queen < Piece 
  include SlidingPiece
  
  def move_dirs(curr_pos)
  end 
end 

class Knight < Piece 
  include SteppingPiece
  
  def move_dirs(curr_pos)
  end 
end 

class King < Piece 
  include SteppingPiece
  
  def move_dirs(curr_pos)
  end 
end 
=end


module SlidingPiece #bishop, rook, queen 
  def move(curr_pos)
    # rook 
    res = []
    8.times do |idx|
      res << [idx, curr_pos[1]]
      res << [curr_pos[0], idx]  
    end
    return res
  end 
end 

# module SteppingPiece #knight,king 
#   def move(curr_pos)
#   end 
# 
# end 

