File.open('input.txt','r') do |f|
   floor = position = 0
   basement_pos = -1
   basement_found = false
   f.each_char do |c| # iterate on each character
      if c == '(' then floor += 1 end
      if c == ')' then floor -= 1 end
      position+=1
      if floor == -1 && basement_found == false then
        basement_pos = position
        basement_found = true
      end
   end
   puts "Floor: #{floor}\nBasement Postion: #{basement_pos}\n"
end
