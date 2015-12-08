code_chars = 0
memory_chars = 0
encoded_length = 0
File.readlines("input.txt").each do |line|
  line = line.chomp
  code_chars += line.length
  memory_chars += eval(line).length
  esc_chars += line.dump.length
end
puts "Part-1:#{code_chars - memory_chars}"
puts "Part-2:#{esc_chars - code_chars}"
