require 'byebug'
MOVES = [[0, -1], [0, 1], [-1, 0], [1, 0]]
DIAGONAL = [[1, 1], [-1, -1], [1, -1], [-1, 1]]


class Piece 
  attr_reader :symbol, :color
  
  def initialize(grid_pos, board, symbol, color)
    @pos = grid_pos
    @board = board
    @symbol = symbol
    @color = color
  end
  
  def moves
    # return []
  end
  
end

class NullPiece < Piece
  
end 
#########

# class Bishop < Piece
#   include SlidingPiece
# 
#   def move_dirs(curr_pos)
#   end 
# end 
# 
# class Rook < Piece
#   include SlidingPiece
# 
#   def move_dirs(curr_pos)
#   end 
# end 
# 
# class Queen < Piece 
#   include SlidingPiece
# 
#   def move_dirs(curr_pos)
#   end 
# end 
# 
# class Knight < Piece 
#   include SteppingPiece
# 
#   def move_dirs(curr_pos)
#   end 
# end 
# 
# class King < Piece 
#   include SteppingPiece
# 
#   def move_dirs(curr_pos)
#   end 
# end 

module SlidingPiece #bishop, rook, queen 
  def move(board, curr_pos, all_pos)
    res = [] 

    all_pos.each do |el|
      tmp = curr_pos.dup
      tmp[0] += el[0]
      tmp[1] += el[1]

      while board.is_within_range?(tmp)
        if board[tmp].is_a?(NullPiece)
          res << tmp.dup
        elsif board[tmp].color == board[curr_pos].color
          break
        else
          res << tmp.dup
          break
        end

        tmp[0] += el[0]
        tmp[1] += el[1]
      end
    end
    return res
  end 
end 

# module SteppingPiece #knight,king 
#   def move(curr_pos)
#   end 
# 
# end 


    