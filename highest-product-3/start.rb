#!/usr/bin/env ruby

#Given an array of integers, find the highest product you can get from three of the integers.

def highest_product(array_of_ints)
	max_product = 1
	for i in 0...array_of_ints.length
		for j in i+1...array_of_ints.length
			for k in j+1...array_of_ints.length
				product = array_of_ints[i] * array_of_ints[j] * array_of_ints[k]
				max_product = product if product > max_product
			end
		end
	end
	max_product
end

puts highest_product([1,2,3,4,5])