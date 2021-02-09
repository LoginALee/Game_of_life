require_relative 'cell'

class Board
  attr_accessor :board

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @board = make_board
  end
 
  def make_board
    grid = Array.new (@columns) {Array.new(@rows)}
    @columns.times do |col| 
      @rows.times do |row|
        cell = Cell.new
        grid[col][row] = cell.get_print_char
      end
    end
    grid 
  end
  
  def draw_board(board)
    board.each do |row|
      p row
    end
  end

  def next_board
    next_board = @board.map(&:clone)
    current_board = next_board.map(&:clone)
    @colums.times do |col|
      @rows.times do |row|

        current_cell = current_board[col][row]
        neighbors = count_neighbors(grid,col,row) 

        if(current_cell.alive? && neighbors == 3)
          next_board[col][row] = 'O'
        elsif(!current_cell.alive? && (neighbors < 2 || neighbors > 3))
          next_board[col][row] = 'X'
        else
          next_board[col][row] = state
        end 
      end
    end
   next_board
  end

  def count_neighbors(board, x, y)
    sum = 0
    (-1...2).each do | i |
      (-1...2).each do | j |

        col = (x + i + @columns) % @columns
        row = (y + j + @rows) % @rows

        sum += 1 if board[col][row] == 'O'

      end
    end
    sum -= 1 if board[x][y] == 'O'
    sum
  end
end

