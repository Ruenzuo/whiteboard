#!/usr/bin/env ruby

require_relative './lib.rb'

def solve(input:)
  return input.first if input.size == 1
  tmp = []
  begin 
    value = input.shift
    tmp.unshift value
  end while not ['+', '-', '*', '/'].include? value
  tmp.shift
  b = tmp.shift
  a = tmp.shift
  result = process(a, b, value)
  solve(input: tmp + [result] + input)
end

def process(a, b, symb)
  int_a = a.to_f
  int_b = b.to_f
  case symb
  when '+'
    int_a + int_b
  when '-'
    int_a - int_b
  when '*'
    int_a * int_b
  when '/'
    int_a / int_b
  end 
end

input = ['2', '1', '+', '3', '*'] # (2 + 1) * 3 = 9
puts solve(input: input)

