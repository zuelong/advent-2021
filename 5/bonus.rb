file = File.readlines('./input.txt', chomp: true)

coords = file.map { |line| line.split(' -> ').map { |pairs| pairs.split(',').map { |n| n.to_i } } }
matrix = Array.new(1000, []).map { |a| Array.new(1000, 0) }

coords.each do |coord1, coord2|
  x1, y1 = coord1
  x2, y2 = coord2

  dx = x2 - x1
  dy = y2 - y1

  if dx == 0
    rise = dy.positive? ? 1 : -1
    run = 0
  else
    slope = Rational("#{dy.abs}/#{dx.abs}")
    rise = dy.positive? ? slope.numerator : -slope.numerator
    run = dx.positive? ? slope.denominator : -slope.denominator
  end

  x = x1
  y = y1

  while x != x2 || y != y2 do
    matrix[x][y] += 1
    x += run
    y += rise
  end
  matrix[x][y] += 1
end

puts matrix.flatten.select { |n| n > 1 }.count