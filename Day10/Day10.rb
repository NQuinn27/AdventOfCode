input = "3113322113"
def look_say(n)
  last_char = n[0]
  count = 1;
  new_output = ""
  for i in 1..n.length
    if n[i] == last_char
      count += 1
    else
      new_output += "#{count}#{last_char}"
      last_char = n[i]
      count = 1
    end
  end
  return new_output
end

for i in 1..50 do
  input = look_say(input)
end
puts input.length
