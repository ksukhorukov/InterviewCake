#!/usr/bin/env ruby

  def change_possibilities_bottom_up(amount, denominations)
    ways_of_doing_n_cents = [0] * (amount + 1)
    ways_of_doing_n_cents[0] = 1

    denominations.each do |coin|
        (coin..amount).each do |higher_amount|
            higher_amount_remainder = higher_amount - coin
            ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
        end
    end

    return ways_of_doing_n_cents[amount]
end