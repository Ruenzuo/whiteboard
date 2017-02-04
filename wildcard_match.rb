#!/usr/bin/env ruby

require_relative './lib.rb'

def is_match(string:, match:)
  split = match.split '*'
  pre = split[0]
  pos = split[1]
  pre&.chars&.each_with_index do |char, index|
    return false if string[index] != char
  end
  pos&.chars&.reverse&.each_with_index do |char, index|
    return false if string[-(index + 1)] != char
  end
  return true
end

puts is_match(string: 'aabcd', match: 'aa*cd')