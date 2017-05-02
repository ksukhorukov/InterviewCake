#!/usr/bin/env ruby

  def reverse(string)

    left_pointer  = 0
    right_pointer = string.length - 1

    while left_pointer < right_pointer

        # swap characters
        string[left_pointer], string[right_pointer] = \
            string[right_pointer], string[left_pointer]

        # move towards middle
        left_pointer  += 1
        right_pointer -= 1

    end

    return string
end