File.open('input.txt','r') do |f|
  santa_x = santa_y = robo_x = robo_y = 0
  hash = Hash.new
  hash["#{0},#{0}"] = "visited"
  switch = true
  f.each_char do |c| # iterate on each character
    if switch then
      if c == '<' then santa_x -= 1 end
      if c == '>' then santa_x += 1 end
      if c == '^' then santa_y += 1 end
      if c == 'v' then santa_y -= 1 end
      hash["#{santa_x},#{santa_y}"] = "visited"
    else
      if c == '<' then robo_x -= 1 end
      if c == '>' then robo_x += 1 end
      if c == '^' then robo_y += 1 end
      if c == 'v' then robo_y -= 1 end
      hash["#{robo_x},#{robo_y}"] = "visited"
    end
    switch = !switch
  end
  puts "#{hash.length}"
end
