#!/usr/bin/env ruby

def parenthesis(str, pos)
	open = []
	for i in pos...str.length
		open.push i if str[i] == '('
		if str[i] == ')'
			if open.length == 1
				return i
			else
				open.pop
			end
		end
	end
end

str = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

puts parenthesis(str, 10)
