File.open('input.txt','r') do |f|
  santa_x = 0
  santa_y = 0
  robo_x = 0
  robo_y = 0
  hash = Hash.new
  hash["#{0},#{0}"] = "visited"
  switch = true
  f.each_char do |c| # iterate on each character
     if c == '<' then
       if switch then
         santa_x -= 1
       else
         robo_x -= 1
       end
     end
     if c == '>' then
       if switch then
         santa_x += 1
       else
         robo_x += 1
       end
     end
     if c == '^' then
       if switch then
         santa_y += 1
       else
         robo_y += 1
       end
     end
     if c == 'v' then
       if switch then
         santa_y -= 1
       else
         robo_y -= 1
       end
     end
     if switch then
       hash["#{santa_x},#{santa_y}"] = "visited"
     else
       hash["#{robo_x},#{robo_y}"] = "visited"
     end
     switch = !switch
  end
  puts "#{hash.length}"
end
