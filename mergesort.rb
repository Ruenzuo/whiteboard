#!/usr/bin/env ruby

require_relative './lib.rb'

def merge(left, right)
  sorted = []
  until (left.empty? or right.empty?)
    if left.first > right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end 
  sorted.concat(left).concat(right)
end

def mergesort(array)
  return array if array.size <= 1
  middle = array.size / 2
  left = array[0, middle]
  right = array[middle, array.size]
  merge(mergesort(left), mergesort(right))
end

input = [3, 2, 1, 5, 6, 10, 11, 7]
mergesort(input).inspect?