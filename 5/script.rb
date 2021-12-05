def _step_array(a, b)
  return a.step(b, 1).to_a if b >= a
  a.step(b, -1).to_a
end

file = File.readlines('./input.txt', chomp: true)

coords = file.map { |line| line.split(' -> ').map { |pairs| pairs.split(',').map { |n| n.to_i } } }
matrix = Array.new(1000, []).map { |a| Array.new(1000, 0) }

coords.each do |coord1, coord2|
  x1, y1 = coord1
  x2, y2 = coord2

  next unless x1 == x2 || y1 == y2

  _step_array(x1,x2).each do |x|
    _step_array(y1,y2).each do |y|
      matrix[x][y] += 1
    end
  end
end

puts matrix.transpose.map { |line| line.join(' ') }

puts matrix.flatten.select { |n| n > 1 }.count