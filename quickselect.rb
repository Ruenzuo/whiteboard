#!/usr/bin/env ruby

require_relative './lib.rb'

def quickselect(array, k)
  return array if array.size <= 1
  pivot = array.sample
  array_length = array.length
  array.delete_at(array.index(pivot))
  left = []
  right = []
  array.each do |e|
    if e > pivot
      left << e
    else
      right << e
    end
  end
  if k <= left.length
    return quickselect(left, k)
  elsif k > array_length - right.length
    return quickselect(right, k - (array_length - right.length))
  else
    return pivot
  end
end

input =  [3, 2, 1, 5, 6, 4]
k = 2

puts quickselect(input, k)