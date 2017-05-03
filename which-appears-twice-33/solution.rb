#!/usr/bin/env ruby

def get_the_number_that_appears_twice(arr)
  sum = arr.reduce(&:+)
  triangular = (n^2 + n)/2
  sum - triangular
end