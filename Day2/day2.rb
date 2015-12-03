def paper_needed(l,w,h)
  lw = l*w
  wh = w*h
  hl = h*l
  min_area = [[lw,wh].min,hl].min
  return (2*lw) + (2*wh) + (2*hl) + min_area
end

def ribbon_needed(l,w,h)
  volume = l*w*h
  plw = 2*l + 2*w
  pwh = 2*w + 2*h
  phl = 2*h + 2*l
  min_perim = [[plw,pwh].min, phl].min
  return min_perim + volume
end

total_paper_needed = total_ribbon_needed = 0
File.readlines('input.txt').each do |line|
    components = line.split("x")
    l = components[0].to_i
    w = components[1].to_i
    h = components[2].to_i
    total_paper_needed += paper_needed(l,w,h)
    total_ribbon_needed += ribbon_needed(l,w,h)
end
puts "Paper Needed: #{total_paper_needed} \n"
puts "Ribbon Needed: #{total_ribbon_needed}\n"
