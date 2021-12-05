def get_value(array_value, oxygen)
  return array_value["1"] >= array_value["0"] ? "1" : "0" if oxygen
  array_value["1"] < array_value["0"] ? "1" : "0"
end

def get_reading(file, oxygen)
  arr = file.first.split('').map { |_| {"0" => 0, "1" => 0} }
  strings = file

  arr.each_with_index do |_, index|
    strings.each_with_index do |line|
      arr[index]["1"] += 1 if line[index] == "1"
      arr[index]["0"] += 1 if line[index] == "0"
    end
    strings = strings.select { |s| s[index] == get_value(arr[index],  oxygen) }

    return strings.first.to_i(2) if strings.count == 1
  end
end

file = File.readlines('./input.txt', chomp: true)
puts get_reading(file, true) * get_reading(file, false)