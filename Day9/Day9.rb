destinations = Hash.new()
names = Hash.new()
File.readlines("input.txt").each do |line|
  split1 = line.split("to")
  split2 = s1[1].split("=")
  p1 = split1[0].strip
  p2 = split2[0].strip
  distance = p2[1].strip.to_i
  destinations["#{p1}:#{p2}"] = distance
  destinations["#{p2}:#{p1}"] = distance
  names[d1] = ""
  names[d2] = ""
end

places = names.keys
perms = places.permutation.to_a

shortest_distance = 999999999
longest_distance = 0

perms.each do |perm|
  distance = 0
  for i in 0..perm.length-2
    startPlace = perm[i]
    endPlace = perm[i+1]
    distance += destinations["#{startPlace}:#{endPlace}"]
  end
  if distance < shortest_distance then
    shortest_distance = distance
  end
  if distance > longest_distance then
    longest_distance = distance
  end
end
puts "Shortest: #{shortest_distance}"
puts "Longest: #{longest_distance}"
