#!/usr/bin/env ruby

require_relative './lib.rb'

def rotate(array:, times:)
  temp = []
  for i in 1..array.length
    pos = times + i
    pos -= array.length if pos > array.length
    temp.push array[pos - 1] # index
  end
  temp
end

# def rotate(array:, times:)
#   times.times do
#     element = array.shift
#     array.push element
#   end
#   array
# end

rotate(array: [1,2,3,4,5,6,7], times: 3).inspect?