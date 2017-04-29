#!/usr/bin/env ruby

require 'pp'

def get_products_of_all_ints_except_at_index(arr)
	result = []
	arr.each_with_index do |val1, i|
		product = 1
		arr.each_with_index do |val2, j|
			product *= val2 if i != j
		end
		result << product
	end
	result
end

arr = [0, 0, 0, 0]
pp get_products_of_all_ints_except_at_index(arr)
