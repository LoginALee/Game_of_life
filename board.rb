require_relative 'cell'

class Board
  attr_accessor :board

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @board = makeBoard
  end
 
  def makeBoard
    grid = Array.new(@columns) 

    grid.each_with_index do |_column,index|
      grid[index] = Array.new(@rows)
    end

    for i in 0...@columns
      for j in 0...@rows
        cell = Cell.new
        grid[i][j] = cell.get_print_char
      end
    end
    grid 
  end
  
  def drawBoard(board)
    for row in board
      p row 
    end
  end

  def nextBoard
    nextBoard = @board
    grid = nextBoard.map(&:clone)
    #Live neighbors    
    for i in 0...@columns
      for j in 0...@rows
        state = grid[i][j]
        neighbors = countNeighbors(grid,i,j) 

        if(state == 'X' && neighbors == 3)
          nextBoard[i][j] = 'O'
        elsif(state == 'O' && (neighbors < 2 || neighbors > 3))
          nextBoard[i][j] = 'X'
        else
          nextBoard[i][j] = state
        end 
      end
    end
   nextBoard
  end

  def countNeighbors(board, x, y)
    sum = 0
    for i in -1...2
      for j in -1...2

        col = (x + i + @columns) % @columns
        row = (y + j + @rows) % @rows

        sum += 1 if board[col][row] == 'O'

      end
    end
    sum -= 1 if board[x][y] == 'O'
    sum
  end
end

