destinations = Hash.new()
names = Hash.new()
File.readlines("input.txt").each do |line|
  s1 = line.split("to")
  s2 = s1[1].split("=")
  d1 = s1[0].strip
  d2 = s2[0].strip
  distance = s2[1].strip.to_i
  destinations["#{d1}:#{d2}"] = distance
  destinations["#{d2}:#{d1}"] = distance
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
