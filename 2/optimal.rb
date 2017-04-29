#!/usr/bin/env ruby

  def get_products_of_all_ints_except_at_index(int_array)

    # make sure we have at least 2 numbers
    if int_array.length < 2
        raise IndexError, 'Getting the product of numbers at other indices requires at least 2 numbers'
    end

    products_of_all_ints_except_at_index = []

    # for each integer, we find the product of all the integers
    # before it, storing the total product so far each time
    product_so_far = 1
    i = 0
    while i < int_array.length
        products_of_all_ints_except_at_index[i] = product_so_far
        product_so_far *= int_array[i]
        i += 1
    end

    # for each integer, we find the product of all the integers
    # after it. since each index in products already has the
    # product of all the integers before it, now we're storing
    # the total product of all other integers
    product_so_far = 1
    i = int_array.length - 1
    while i >= 0
        products_of_all_ints_except_at_index[i] *= product_so_far
        product_so_far *= int_array[i]
        i -= 1
    end

    return products_of_all_ints_except_at_index
end

