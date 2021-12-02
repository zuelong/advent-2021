increase_count = 0
previous_number = nil

File.readlines('./input.txt', chomp: true).each do |current_line|
  current_number = current_line.to_i

  increase_count += 1 if previous_number && current_number > previous_number

  previous_number = current_number
end

puts increase_count