people = []
happiness = Hash.new()
File.readlines("input.txt").each do |line|
  line.strip
  parts = line.split(" ")
  p1 = parts[0]
  delta = parts[3].to_i
  if parts[2]== "lose" then
    delta = -delta
  end
  p2 = parts[10].tr(".","")
  if !people.include?(p1)
    people.push(p1)
  end
  happiness["#{p1}:#{p2}"] = delta
end

for p in people do
  happiness["Me:#{p}"] = 0
  happiness["#{p}:Me"] = 0
end
people.push("Me")

perms = people.permutation.to_a
highest_happiness = -99999999999
best_arrangement = []
perms.each do |perm|
  rolling_happiness = 0
  for i in 0..perm.length-2 do
    rolling_happiness = rolling_happiness + happiness["#{perm[i]}:#{perm[i+1]}"].to_i
    rolling_happiness = rolling_happiness + happiness["#{perm[i+1]}:#{perm[i]}"].to_i
  end
  rolling_happiness = rolling_happiness + happiness["#{perm[0]}:#{perm[perm.length-1]}"].to_i
  rolling_happiness = rolling_happiness + happiness["#{perm[perm.length-1]}:#{perm[0]}"].to_i
  if rolling_happiness > highest_happiness then
    highest_happiness = rolling_happiness
    best_arrangement = perm
  end
end

puts highest_happiness.to_s
puts best_arrangement.to_s
