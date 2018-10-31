require_relative 'piece.rb'
require_relative '../pieces/nullpiece.rb'
require_relative '../pieces/rook.rb'
require_relative '../pieces/knight.rb'
require_relative '../pieces/bishop.rb'
require_relative '../pieces/queen.rb'
require_relative '../pieces/king.rb'
require_relative '../pieces/pawn.rb'


class Board
  attr_reader :grid
  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid 
    setup_grid
  end 
  
  def setup_grid
    @grid.each_with_index do |row,idx|
      row.each_with_index do |cell, idx2|
        if idx == 1 
          @grid[idx][idx2] = Pawn.new([idx, idx2], self)
        elsif idx == 6
          @grid[idx][idx2] = Pawn.new([idx, idx2], self, " ♟  ", "black")
          
        elsif idx == 0
          case idx2
          when 0, 7
            @grid[idx][idx2] = Rook.new([idx, idx2], self)
          when 1, 6
            @grid[idx][idx2] = Knight.new([idx, idx2], self)
          when 2, 5
            @grid[idx][idx2] = Bishop.new([idx, idx2], self)
          when 3
            @grid[idx][idx2] = Queen.new([idx, idx2], self)
          when 4
            @grid[idx][idx2] = King.new([idx, idx2], self)
          end
          
        elsif idx == 7  
          case idx2
          when 0, 7
            @grid[idx][idx2] = Rook.new([idx, idx2], self, " ♜  ", "black")
          when 1, 6
            @grid[idx][idx2] = Knight.new([idx, idx2], self, " ♞  ", "black")
          when 2, 5
            @grid[idx][idx2] = Bishop.new([idx, idx2], self, " ♝  ", "black")
          when 3
            @grid[idx][idx2] = Queen.new([idx, idx2], self, " ♛  ", "black")
          when 4
            @grid[idx][idx2] = King.new([idx, idx2], self, " ♚  ", "black")
          end
          
        else
          @grid[idx][idx2] = NullPiece.instance
          @grid[idx][idx2].symbol
        end
         
      end 
    end 
  end
    
  
  def [](pos)
    x,y = pos
    @grid[x][y]
  end 
  
  def []=(pos,value)
    x,y = pos
    @grid[x][y] = value
  end 
  
  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "there is no piece there, buddy!"
    elsif !is_within_range?(end_pos)
       raise "Out of bound, buddy!"
    end
    
    valid_moves = self[start_pos].move_dirs
    p valid_moves
    if !valid_moves.include?(end_pos)
      raise "That's not a valid move, buddy!"
    end
    
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]  
    if !self[start_pos].is_a?(NullPiece)
      self[start_pos].update_pos(start_pos)
    end
    
    if !self[end_pos].is_a?(NullPiece)
      self[end_pos].update_pos(end_pos)
    end
  end 
  
  def is_within_range?(end_pos)
    return false if end_pos[0] >= 8 || end_pos[0] < 0 || end_pos[1] >= 8 || end_pos[1] < 0
    return true
  end 
    
end