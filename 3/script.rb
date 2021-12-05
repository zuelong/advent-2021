arr = []
len = 0

File.readlines('./input.txt', chomp: true).each do |line|
  line.split("").each do |_|
    arr.push({"0" => 0, "1" => 0})
  end
  break
end

arr.each_with_index do |_, index|
  File.readlines('./input.txt', chomp: true).each do |line|
    arr[index]["1"] += 1 if line[index] == "1"
    arr[index]["0"] += 1 if line[index] == "0"
  end
end

max = []
min = []
arr.each do |digit|
  puts digit
  max.push(digit["1"] >= digit["0"] ? "1" : "0")
  min.push(digit["1"] < digit["0"] ? "1" : "0")
end

puts max.join("").to_i(2) * min.join("").to_i(2)