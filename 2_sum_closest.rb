#!/usr/bin/env ruby

require_relative './lib.rb'

def find(array:, target:)
  map = {}
  array.each_with_index do |n, index|
    if map.include? n
      f_index = map[n]
      return [index, f_index]
    else
      map[target - n] = index
    end
  end
end

input = [3, 7, 1, 4, 2, 11, 15]
target = 9
puts find(array: input, target: target)