total_paper_needed = total_ribbon_needed = 0
File.readlines('input.txt').each do |line|
    components = line.split("x")
    l = components[0].to_i
    w = components[1].to_i
    h = components[2].to_i

    lw = l*w
    plw = 2*l + 2*w
    wh = w*h
    pwh = 2*w + 2*h
    hl = h*l
    phl = 2*h + 2*l

    volume = l*w*h

    min_area = [[lw,wh].min,hl].min
    min_perim = [[plw,pwh].min, phl].min
    paper_needed = (2*lw) + (2*wh) + (2*hl) + min_area
    ribbon_needed = min_perim + volume
    total_paper_needed += paper_needed
    total_ribbon_needed += ribbon_needed
end
puts "Paper Needed: #{total_paper_needed} \n"
puts "Ribbon Needed: #{total_ribbon_needed}\n"
