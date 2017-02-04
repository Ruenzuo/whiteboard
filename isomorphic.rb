#!/usr/bin/env ruby

require_relative './lib.rb'

def isomorphic?(a:, b:)
  return false if a.empty? or b.empty?
  return false if a.length != b.length
  mapping = {}
  a.chars.each_with_index do |char, i|
    mapping_exits = !mapping[char].nil?
    mapping_right = mapping[char] == b[i]
    return false if mapping_exits and !mapping_right
    mapping[char] = b[i]
  end
  true
end

puts isomorphic?(a: 'egg', b: 'boo')