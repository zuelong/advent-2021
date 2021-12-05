def check_board(board, called_numbers)
  board.each do |row|
    if (row - called_numbers).empty?
      return true
    end
  end

  false
end

def determine_winner(numbers, boards)
  numbers.each_with_index do |number, index|
    called_numbers = numbers[0..index]
    boards.each do |board|
      return board.map { |row| row - called_numbers }.flatten.sum * number if check_board(board, called_numbers) || check_board(board.transpose, called_numbers)
    end
  end
end

numbers = []
boards = []

File.readlines('./input.txt', chomp: true).each_with_index do |line, index|
  if index == 0
    numbers = line.split(',').map { |n| n.chomp.to_i }
    next
  end

  if line == ""
    boards.push([])
    next 
  else
    board_index = boards.count - 1
    row = line.split(' ').map { |n| n.chomp.to_i }
    boards[board_index].push(row)
  end
end

puts determine_winner(numbers, boards)