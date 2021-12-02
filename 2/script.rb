location = 0
depth = 0

File.readlines('./input.txt', chomp: true).each do |line|
  line = line.split(" ")

  location += line[1].to_i if line[0] == "forward"
  depth += line[1].to_i if line[0] == "down"
  depth -= line[1].to_i if line[0] == "up"
end

puts depth * location