#!/usr/bin/env ruby

  def fib(n)

    # edge cases:
    if n < 0
        raise Exception, "Index was negative. No such thing as a negative index in a series."

    elsif n == 0 || n == 1
        return n
    end

    # we'll be building the fibonacci series from the bottom up
    # so we'll need to track the previous 2 numbers at each step
    prev_prev = 0   # 0th fibonacci
    prev = 1        # 1st fibonacci
    current = 0     # Declare and initialize current

    (n - 1).times do
        # Iteration 1: current = 2nd fibonacci
        # Iteration 2: current = 3rd fibonacci
        # Iteration 3: current = 4th fibonacci
        # To get nth fibonacci ... do n-1 iterations.
        current = prev + prev_prev
        prev_prev = prev
        prev = current
    end

    return current
end

  class Fibber
    def initialize
        @memo = {}
    end

    def fib(n)

        # edge case: negative index
        if n < 0
            raise Exception, "Index was negative. No such thing as a negative index in a series."

        # base case: 0 or 1
        elsif n == 0 || n == 1
            return n
        end

        # see if we've already calculated this
        if @memo.include? n
            return @memo[n]
        end

        result = self.fib(n-1) + self.fib(n-2)

        # memoize
        @memo[n] = result

        return result
    end
end