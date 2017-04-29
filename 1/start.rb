#!/usr/bin/env ruby

def get_max_profit(stock_prices_yesterday)
	max = 0
	for i in 0..stock_prices_yesterday.size-1 do
		for j in ((i+1)..stock_prices_yesterday.size-1) do
			profit = stock_prices_yesterday[j] - stock_prices_yesterday[i]
			max = profit if profit > max
		end
	end

	max

end

stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

puts get_max_profit(stock_prices_yesterday)