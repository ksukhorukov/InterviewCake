#!/usr/bin/env ruby

  def highest_product_of_3(array_of_ints)
    if array_of_ints.length < 3
        raise Exception, 'Less than 3 items!'
    end

    # We're going to start at the 3rd item (at index 2)
    # so pre-populate highests and lowests based on the first 2 items.
    # we could also start these as nil and check below if they're set
    # but this is arguably cleaner
    highest = [array_of_ints[0], array_of_ints[1]].max
    lowest =  [array_of_ints[0], array_of_ints[1]].min

    highest_product_of_2 = array_of_ints[0] * array_of_ints[1]
    lowest_product_of_2  = array_of_ints[0] * array_of_ints[1]

    # except this one--we pre-populate it for the first *3* items.
    # this means in our first pass it'll check against itself, which is fine.
    highest_product_of_3 = array_of_ints[0] * array_of_ints[1] * array_of_ints[2]

    # walk through items, starting at index 2
    # (we could slice the array but that would use n space)
    array_of_ints.each_with_index do |current, index|
        next if index < 2

        # do we have a new highest product of 3?
        # it's either the current highest,
        # or the current times the highest product of two
        # or the current times the lowest product of two
        highest_product_of_3 = [
            highest_product_of_3,
            current * highest_product_of_2,
            current * lowest_product_of_2
        ].max

        # do we have a new highest product of two?
        highest_product_of_2 = [
            highest_product_of_2,
            current * highest,
            current * lowest
        ].max

        # do we have a new lowest product of two?
        lowest_product_of_2 = [
            lowest_product_of_2,
            current * highest,
            current * lowest
        ].min

        # do we have a new highest?
        highest = [highest, current].max

        # do we have a new lowest?
        lowest = [lowest, current].min
    end

    return highest_product_of_3
end