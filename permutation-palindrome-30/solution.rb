#!/usr/bin/env ruby


  require 'set'

def has_palindrome_permutation(the_string)

    # track characters we've seen an odd number of times
    unpaired_characters = Set.new

    (0...the_string.length).each do |i|
        char = the_string[i]

        if unpaired_characters.include? char
            unpaired_characters.delete(char)
        else
            unpaired_characters.add(char)
        end
    end

    # the string has a palindrome permutation if it
    # has one or zero characters without a pair
    return unpaired_characters.length <= 1
end