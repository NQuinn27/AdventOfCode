def is_valid(s)
  has_increasing_straight = false
  pairs = []
  skip = false
  for i in 0..s.length
    c = s[i]
    case c
    when 'i'
      return false
    when 'o'
      return false
    when 'l'
      return false
    end
    if i > 2 then
      a = s[i-2]
      b = s[i-1]
      if c.to_s.sum - b.to_s.sum == 1 && b.to_s.sum - a.to_s.sum == 1 then
        has_increasing_straight = true
      end
    end
    if i > 1 then
      if !skip then
        if s[i] == s[i-1] then
          pairs << "pair"
          skip = true
        end
      else
        skip = false
      end
    end
  end
  return has_increasing_straight && pairs.count > 1
end

def increment_string(s)
  array = s.split("")
  i = array.length-1
  while i >= 0
    char = array[i]
    array[i] = increment_char(array[i].to_s.sum).chr
    if array[i] != "a"
      break
    end
    i -= 1
  end
  return array.join("")
end

def increment_char(c)
  if c == 122
    return 97
  else
    return c += 1
  end
end
input = "vzbxxyzz"
while true
  input = increment_string(input)
  if is_valid(input)
    puts "valid: #{input}"
    break
  end
  puts input
end
puts input
