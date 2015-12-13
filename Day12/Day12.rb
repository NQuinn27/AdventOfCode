require 'json'
input = JSON.parse(File.read('input.txt'))
def parse(input)
  sum = 0
  if input.respond_to? :keys
    return 0 if input.values.include? "red"
    input.keys.each do |k|
      sum += input[k].is_a?(Fixnum) ? input[k] : parse(input[k])
    end
  elsif input.is_a?(Array)
    input.each do |v|
      sum += v.is_a?(Fixnum) ? v : parse(v)
    end
  elsif input.is_a?(Fixnum)
    sum += input
  end
  return sum
end
puts parse(input)
