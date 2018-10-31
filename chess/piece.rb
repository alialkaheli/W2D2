MOVES = [[0, -1], [0, 1], [-1, 0], [1, 0]]
DIAGONAL = [[1, 1], [-1, -1], [1, -1], [-1, 1]]
HORSE1 = [[2,1],[2,-1],[1,2],[1,-2]]
HORSE2 = [[-2, 1],[-2, -1],[-1, 2],[-1, -2]]

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
  
  def update_pos(new_pos)
    @pos = new_pos
  end
  
end
