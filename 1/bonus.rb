increase_count = 0
buffer = []

File.readlines('./input.txt', chomp: true).each do |current_line|
  buffer.push(current_line.to_i)

  next unless buffer.compact.count == 4

  increase_count += 1 if buffer[1..3].sum > buffer[0..2].sum
  buffer.shift
end

puts increase_count