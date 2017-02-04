#!/usr/bin/env ruby

require_relative './lib.rb'

class Node
  attr_accessor :word
  attr_accessor :adyacent_nodes
  attr_accessor :visited
  attr_accessor :parent

  def initialize(word)
    self.word = word
    self.adyacent_nodes = []
    self.visited = false
  end

  def find_adyacent_nodes(nodes:)
    nodes.each do |node|
      next if self.word.eql? node.word
      if differences(a: self.word, b: node.word) == 1
        self.adyacent_nodes << node
      end
    end
  end
end

def differences(a:, b:)
  diffs = 0
  a.chars.each_with_index do |char, index|
    diffs += 1 if char != b[index]
  end
  diffs
end

def create_tree(input:)
  nodes = input.map { |word| Node.new(word) }
  nodes.each do |node|
    node.find_adyacent_nodes(nodes: nodes)
  end
  nodes
end

def find_shortest_path(start:, finish:, input:)
  tree = create_tree(input: [start] + input + [finish])
  queue = []
  tree.first.visited = true
  queue << tree.first

  while not queue.empty?
    current = queue.pop
    if current.word.eql? finish
      return current
    end
    current.adyacent_nodes.each do |node|
      next if node.visited
      node.visited = true
      node.parent = current
      queue.unshift node
    end
  end
end

start = 'hit'
finish = 'cog'
input = ['hot', 'dot', 'dog', 'lot', 'log']

node = find_shortest_path(start: start, finish: finish, input: input)
begin
  puts node.word
  node = node.parent
end while not node.nil?