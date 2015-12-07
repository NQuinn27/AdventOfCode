lights = Hash.new
for i in 0..999
  for j in 0..999
    lights["#{i}, #{j}"] = 0
  end
end

File.readlines('input.txt').each do |line|
  components = line.split(" ")
  if components[0] == "turn" && components[1] == "on" then
    x1 = components[2].split(",")[0].to_i
    y1 = components[2].split(",")[1].to_i
    x2 = components[4].split(",")[0].to_i
    y2 = components[4].split(",")[1].to_i
    for i in x1..x2
      for j in y1..y2
        lights["#{i}, #{j}"] += 1
      end
    end
  end
  if components[0] == "turn" && components[1] == "off" then
    x1 = components[2].split(",")[0].to_i
    y1 = components[2].split(",")[1].to_i
    x2 = components[4].split(",")[0].to_i
    y2 = components[4].split(",")[1].to_i
    for i in x1..x2
      for j in y1..y2
        lights["#{i}, #{j}"] -= 1 unless lights["#{i}, #{j}"] < 1
      end
    end
  end
  if components[0] == "toggle" then
    x1 = components[1].split(",")[0].to_i
    y1 = components[1].split(",")[1].to_i
    x2 = components[3].split(",")[0].to_i
    y2 = components[3].split(",")[1].to_i
    for i in x1..x2
      for j in y1..y2
        lights["#{i}, #{j}"] += 2
      end
    end
  end
end
count = 0
lights.each do |key, value|
  count += value
end
puts count
