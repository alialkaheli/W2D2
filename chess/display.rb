require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'
require 'byebug'

class Display 
  attr_reader :cursor, :board
  
  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    @board.grid.each_with_index do |row,idx|
      row.each_with_index do |cell,idx2| 
        # if @cursor.previous_selected.empty?
        #   @cursor.previous_selected = [idx, idx2]
        #   @cursor.previous_selected = cell.symbol.colorize(:background => :purple )
        # end
        
        if [idx, idx2] == @cursor.previous_selected
          print cell.symbol.colorize(:background => :magenta ) 
          next
        end
        
        if [idx, idx2] == @cursor.cursor_pos
          print cell.symbol.colorize(:background => :red ) 
          next
        end
          
        if (idx + idx2).even? 
          print cell.symbol.colorize(:background => :green )
        elsif (idx + idx2).odd? 
          print cell.symbol.colorize(:background => :blue)  
        end   
      end
      puts  
    end
    nil
  end 
end 

d = Display.new
while true
  d.render
  d.cursor.get_input
  puts
  puts
end

