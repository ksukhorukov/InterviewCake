#!/usr/bin/env ruby

def get_unique(arr)
	frequency = Hash.new(0)
	arr.each do |number|
		frequency[number] += 1
	end
	frequency.key 1
end

arr = [1,1,1, 2, 3, 3, 3, 4, 4]

puts get_unique(arr)