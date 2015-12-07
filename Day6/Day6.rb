lights = Hash.new
for i in 0..999
  for j in 0..999
    lights["#{i}, #{j}"] = false
  end
end

File.readlines('input.txt').each do |line|
  components = line.split(" ")
  if components[0] == "turn" && components[1] == "off" then
    coord1_x = components[2].split(",")[0].to_i
    coord1_y = components[2].split(",")[1].to_i
    coord2_x = components[4].split(",")[0].to_i
    coord2_y = components[4].split(",")[1].to_i
    puts "off"
    for i in coord1_x..coord2_x
      for j in coord1_y..coord2_y
        lights["#{i},#{j}"] = false;
      end
    end
  end
  if components[0] == "turn" && components[1] == "on" then
    coord1_x = components[2].split(",")[0].to_i
    coord1_y = components[2].split(",")[1].to_i
    coord2_x = components[4].split(",")[0].to_i
    coord2_y = components[4].split(",")[1].to_i
    puts "on"
    for i in coord1_x..coord2_x
      for j in coord1_y..coord2_y
        lights["#{i},#{j}"] = true;
      end
    end
  end
  if components[0] == "toggle" then
    coord1_x = components[1].split(",")[0].to_i
    coord1_y = components[1].split(",")[1].to_i
    coord2_x = components[3].split(",")[0].to_i
    coord2_y = components[3].split(",")[1].to_i
    puts "toggle"
    for i in coord1_x..coord2_x
      for j in coord1_y..coord2_y
        lights["#{i},#{j}"] ^= true
      end
    end
  end
end
count = 0
for i in 0..999
  for j in 0..999
    if lights["#{i},#{j}"] == true then count +=1 end
  end
end
puts count
