class Array
  def inspect?
    puts "#{self.join ','}"
  end

  def swap!(index_a, index_b)
    self[index_a], self[index_b] = self[index_b], self[index_a]
  end
end