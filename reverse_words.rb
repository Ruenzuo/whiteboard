#!/usr/bin/env ruby

require_relative './lib.rb'

s = 'the sky is blue'

def reverse(sentence:)
  k = 0
  for i in 0..sentence.length - 1
    if sentence[i] == ' '
      reverse_in_place(sentence: sentence, s: k, e: i - 1)
      k = i + 1
    end
  end
  reverse_in_place(sentence: sentence, s: k, e: sentence.length - 1)
  reverse_in_place(sentence: sentence, s: 0, e: sentence.length - 1)

  puts sentence
end

def reverse_in_place(sentence:, s:, e:)
  i = s
  j = e
  while i < j do
    tmp = sentence[i]
    sentence[i] = sentence[j]
    sentence[j] = tmp
    i += 1
    j -= 1
  end
end

puts reverse(sentence: s)