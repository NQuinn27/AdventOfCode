#!/usr/bin/env ruby
#

require 'pp'

data = File.readlines("input.txt")
$machine = {}
$output = {}
puts "1"
data.each do |c|
  x,y = c.chomp.split('->')
  y = y.lstrip
  $machine[y] = x.split
  puts "2"
end

def foo(gate)
  puts "3"
  if gate.match(/^\d+$/)
    return gate.to_i
  end

  if ! $output.has_key?(gate)
    puts "4"
    operate = $machine[gate]
    if operate.length == 1
      value = foo(operate[0])
    else
      z = operate[-2]
      if z == 'RSHIFT'
        value = foo(operate[0]) >> foo(operate[2])
      elsif z == 'LSHIFT'
        value = foo(operate[0]) << foo(operate[2])
      elsif z == 'AND'
        value = foo(operate[0]) & foo(operate[2])
      elsif z == 'OR'
        value = foo(operate[0]) | foo(operate[2])
      elsif z == 'NOT'
        value = ~foo(operate[1])
      end
    end
    $output[gate] = value
  end
  puts "5"
  return $output[gate]
end

p foo('a')
