require_relative 'cell'

class Board
  attr_accessor :board, :grid

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @board =  self.makeBoard()
    @grid = self.makeGrid()
  end

  def makeBoard
    array = Array.new(@columns)
    for i in 0..array.length 
      array[i] = Array.new(@rows)
    end
    return array
  end
 
  def makeGrid
    grid = @board
    for i in 0..@columns
      for j in 0..@rows
        cell1 = Cell.new
        chanceNumber = rand(2)
         
        if chanceNumber == 1
          cell1.status = 'Alive'
        else
          cell1.status = 'Dead'
        end
      grid[i][j] = cell1.get_print_char
    end
  end
    return grid 
  end
  
  def drawBoard
    for row in @board
      p row 
    end
    puts "\n"
  end
end

