#!/usr/bin/env ruby

def reverse_words(words)
	words.split(' ').reverse.join(' ')
end

message = 'find you will pain only go you recordings security the into if'

puts reverse_words(message)
