require_relative 'cell'
require_relative 'board'

puts "Welcome, please introduce the number of columns"
columns = gets.to_i
puts "And also the number of rows"
rows = gets.to_i

board1 = Board.new(columns, rows)
play = "\n"

board1.drawBoard(board1.board)
prevBoard = board1
while play == "\n"
  puts "Press enter to see next generation or any letter to exit"
  play = gets 
  board2 = Board.new(columns,rows)
  board2.drawBoard(prevBoard.nextBoard())
  prevBoard = board2
  if play != "\n"
    break
  end
end

  
