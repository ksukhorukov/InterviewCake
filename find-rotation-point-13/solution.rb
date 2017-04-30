#!/usr/bin/env ruby

words = [
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'asymptote', # <-- rotates here!
    'babka',
    'banoffee',
    'engender',
    'karpatka',
    'othellolagkage',
]

def find_rotation_point(words)

    first_word = words[0]

    floor_index = 0
    ceiling_index = words.length - 1

    while floor_index < ceiling_index

        # guess a point halfway between floor and ceiling
        guess_index = floor_index + ((ceiling_index - floor_index) / 2)

        # if guess comes after first word or is the first word
        if words[guess_index] >= first_word
            # go right
            floor_index = guess_index
        else
            # go left
            ceiling_index = guess_index
        end

        # if floor and ceiling have converged
        if floor_index + 1 == ceiling_index

            # between floor and ceiling is where we flipped to the beginning
            # so ceiling is alphabetically first
            return ceiling_index
        end
    end
end