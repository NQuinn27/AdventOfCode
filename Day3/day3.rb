File.open('input.txt','r') do |f|
  current_x = current_y = 0
  hash = Hash.new
  hash["#{0},#{0}"] = "visited"
  f.each_char do |c| # iterate on each character
     if c == '<' then current_x -= 1 end
     if c == '>' then current_x += 1 end
     if c == '^' then current_y += 1 end
     if c == 'v' then current_y -= 1 end
    hash["#{current_x},#{current_y}"] = "visited"
  end
  puts "Houses hit: #{hash.length}"
end
