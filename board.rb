require_relative 'cell'

class Board
  attr_accessor :board

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @board = make_board
  end
 
  def make_board
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
  
  def draw_board(board)
    for row in board
      p row 
    end
  end

  def next_board
    next_board = @board
    grid = next_board.map(&:clone)
    #Live neighbors    
    for i in 0...@columns
      for j in 0...@rows
        state = grid[i][j]
        neighbors = count_neighbors(grid,i,j) 

        if(state == 'X' && neighbors == 3)
          next_board[i][j] = 'O'
        elsif(state == 'O' && (neighbors < 2 || neighbors > 3))
          next_board[i][j] = 'X'
        else
          next_board[i][j] = state
        end 
      end
    end
   next_board
  end

  def count_neighbors(board, x, y)
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

