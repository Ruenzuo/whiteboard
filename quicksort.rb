#!/usr/bin/env ruby

require_relative './lib.rb'

def quicksort(array)
  return array if array.size <= 1
  pivot = array.sample
  array.delete_at(array.index(pivot))
  left = []
  right = []
  array.each do |e|
    if e < pivot
      left << e
    else
      right << e
    end
  end
  quicksort(left) + [pivot] + quicksort(right)
end

input =  [3, 2, 1, 5, 6, 4]
quicksort(input).inspect?