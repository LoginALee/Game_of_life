require_relative 'cell'

class Board
  attr_accessor :board

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @board =  self.makeBoard()
  end

 
  def makeBoard
    grid = Array.new(@columns) 

    for i in 0...grid.length
      grid[i] = Array.new(@rows)
    end

    for i in 0...@columns
      for j in 0...@rows
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
  
  def drawBoard(board)
    for row in board
      p row 
    end
    puts "\n"
  end

  def nextBoard
    nextBoard = @board
    grid = nextBoard
    #Live neighbors    
    for i in 0...@columns
      for j in 0...@rows
        state = grid[i][j]
         neighbors = self.countNeighbors(grid,i,j) 

        if(state == 'X' && neighbors == 3)
          nextBoard[i][j] = 'O'
        elsif(state == 'O' && (neighbors < 2 || neighbors > 3))
          nextBoard[i][j] = 'X'
        else
          nextBoard[i][j] = state
        end 
      end
    end
    return nextBoard
  end

  def countNeighbors(board, x, y)
    sum = 0
    for i in -1..2
      for j in -1..2

        col = (x + i + @columns) % @columns
        row = (y + j + @rows) % @rows

        if board[col][row] == 'O'
          sum += 1
        end

      end
    end
    
    if board[x][y] == 'O'
      sum -= 1
    end
    
    return sum
  end
end

