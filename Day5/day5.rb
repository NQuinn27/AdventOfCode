
def rule1(s)
  components = s.split(//)
  vowels = 0
  for c in components
    case c
    when "a"
      vowels += 1
    when "e"
      vowels += 1
    when "i"
      vowels += 1
    when "o"
      vowels += 1
    when "u"
      vowels += 1
    end
  end
  return vowels >= 3
end

def rule2(s)
  left = 0
  right = 1
  while right < s.length
    if s[left] == s[right] then
      return true
    end
    right += 1
    left += 1
  end
  return false
end

def rule3(s)
  if s.include? "ab"
    return false
  end
  if s.include? "cd"
    return false
  end
  if s.include? "pq"
    return false
  end
  if s.include? "xy"
    return false
  end
  return true
end

nice = 0
File.readlines('input.txt').each do |line|
  if rule1(line) == true && rule2(line) == true && rule3(line) == true then
    nice += 1
  end
end
puts "#{nice}"
