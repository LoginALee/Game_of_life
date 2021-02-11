require_relative 'cell'
require_relative 'board'

puts "Welcome, please introduce the number of columns"
columns = gets.to_i
puts "And also the number of rows"
rows = gets.to_i

board = Board.new(columns, rows)
play = "\n"

board.draw_board(board.board)
prevBoard = board.board.map(&:clone)

while play == "\n"
  puts "Press enter to see next generation or any letter to exit"
  play = gets 
  board2 = Board.new(columns,rows)
  board2.draw_board(prevBoard)
  prevBoard = board2.board.map(&:clone)
end

  
