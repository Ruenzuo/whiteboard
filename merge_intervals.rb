#!/usr/bin/env ruby

require_relative './lib.rb'

def merge(intervals:)
  intervals.sort! do |a, b|
    a.first <=> b.first
  end
  first = intervals.shift
  solution = [first]
  begin
    current = intervals.shift
    last_entry = solution.last
    if last_entry[1] > current[0]
      if last_entry[1] < current[1]
        last_entry[1] = current[1]
      end
    else
      solution << current
    end
  end while not intervals.empty?
  solution
end

input = [[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]]
input << [4, 9]
merge(intervals: input).inspect?