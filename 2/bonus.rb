location = 0
depth = 0
aim = 0

File.readlines('./input.txt', chomp: true).each do |line|
  line = line.split(" ")

  if line[0] == "forward"
    location += line[1].to_i
    depth += aim * line[1].to_i
  end

  aim += line[1].to_i if line[0] == "down"
  aim -= line[1].to_i if line[0] == "up"
end

puts depth * location