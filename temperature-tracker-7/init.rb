#!/usr/bin/env ruby

class TempTracker

	def initialize
		@temperatures = []
		@stats = Hash.new(0)
		@min = nil
		@max = nil
	end

	def insert(val)
		@temperatures << val
		@stats[val] += 1

		@min = val if @min.nil?
		@max = val if @max.nil?

		@min = val if val < @min
		@max = val if val > @max
	end

	def get_max
		@max
	end

	def get_min
		@min
	end

	def get_mean
		@temperatures.reduce(:+) / @temperatures.size
	end

	def get_mode
		max_frequency = @stats.values.max
		@stats.key(max_frequency)
	end

	def print
		puts @temperatures
	end

end

tracker = TempTracker.new

100.times { tracker.insert(rand(110)) }

puts tracker.get_min
puts tracker.get_max
puts tracker.get_mean
puts tracker.get_mode
