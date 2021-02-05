require_relative 'cell'
require_relative 'board'

board1 = Board.new(4,4)
board1.drawBoard(board1.board)
board1.drawBoard(board1.nextBoard())
