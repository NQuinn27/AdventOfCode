def has_repeats(s)
  for i in 0..s.length-2
    pair = s[i,2]
    remaining = s[i+2..-1]
    if remaining.include? pair then
      return true;
    end
  end
  return false
end

def has_repeats_with_gap(s)
  for i in 0..s.length-2
    if s[i] == s[i+2]
      return true
    end
  end
  return false
end
count = 0
File.readlines('input.txt').each do |line|
  next unless has_repeats(line)
  next unless has_repeats_with_gap(line)
  count += 1
end
puts count
