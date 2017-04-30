#!/usr/bin/env ruby

def find(arr, n)
  
  median = arr.size / 2

  if arr[median] == n
    true
  elsif arr.size > 1
    return find(arr[0..median], n) if arr[median] > n
    return find(arr[median..arr.size-1], n) if arr[median] < n
  else
    false
  end
end

arr = [1, 2, 3, 4, 5]

puts find(arr,ARGV[0].to_i)