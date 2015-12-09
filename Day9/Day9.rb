destinations = Hash.new()
names = Hash.new()
File.readlines("input.txt").each do |line|
  parts = line.split(" ")
  d1 = parts[0]
  d2 = parts[2]
  distance = parts[4].to_i
  destinations["#{d1}:#{d2}"] = destinations["#{d2}:#{d1}"] = distance
  names[d1] = names[d2] = ""
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
