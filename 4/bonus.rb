def check_board(board, called_numbers)
  board.each do |row|
    if (row - called_numbers).empty?
      return true
    end
  end

  false
end

def determine_last_winner(numbers, boards)
  winning_boards = []
  numbers.each_with_index do |number, index|
    called_numbers = numbers[0..index]
    boards.each_with_index do |board, board_index|
      next if winning_boards.include?(board_index)

      winning_boards.push(board_index) if check_board(board, called_numbers) || check_board(board.transpose, called_numbers)

      return board.map { |row| row - called_numbers }.flatten.sum * number if boards.count == winning_boards.count
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

puts determine_last_winner(numbers, boards)