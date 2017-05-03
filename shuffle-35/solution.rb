#!/usr/bin/env ruby

def shuffle(arr)
  for i in 0...arr.size do
  	rnd = rand(arr.size-1)
  	arr[i], arr[rnd] = arr[rnd], arr[i]
  end
  arr
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts shuffle(arr)