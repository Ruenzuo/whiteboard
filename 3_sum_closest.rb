#!/usr/bin/env ruby

require_relative './lib.rb'

def find(array:, target:)
  closest = array.map { |e| e.abs }.reduce(:+)
  solution = 0
  array.sort!
  array.each_with_index do |n, i|
    j = i + 1
    k = array.size - 1
    while (j < k) do
      sum = n + array[j] + array[k]
      diff = (sum - target).abs
      if diff < closest
        closest = diff
        solution = sum
      end
      if sum <= target
        k -= 1
      else
        j += 1
      end
    end
  end
  solution
end

input = [-1, 2, 1, -4]
target = 1

puts find(array: input, target: target)