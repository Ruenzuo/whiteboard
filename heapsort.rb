#!/usr/bin/env ruby

require_relative './lib.rb'

def heapify(array, size, i)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  if (left < size && array[left] > array[largest])
    largest = left
  end

  if (right < size && array[right] > array[largest])
    largest = right
  end

  if largest != i
    array.swap!(i, largest)
    heapify(array, size, largest)
  end
end

def create_heap(array)
  n = array.size
  i = n / 2 - 1
  begin
    heapify(array, n, i)
    i -= 1
  end while i >= 0
  array
end

def heapsort(array)
  heap = create_heap(array)
  n = array.length
  i = n - 1
  begin
    array.swap!(0, i)
    heapify(array, i, 0)
    i -= 1
  end while i >= 0
  array
end

array = [3, 2, 6, 4, 1, 5]
array.inspect?
sorted = heapsort(array)
sorted.inspect?