#!/usr/bin/env ruby

class LinkedListNode

    attr_accessor :value, :next

    def initialize(value)
        @value = value
        @next  = nil
    end
end

  def contains_cycle(first_node)

    # start both runners at the beginning
    slow_runner = first_node
    fast_runner = first_node

    # until we hit the end of the list
    while fast_runner != nil && fast_runner.next != nil
        slow_runner = slow_runner.next
        fast_runner = fast_runner.next.next

        # case: fast_runner is about to "lap" slow_runner
        if fast_runner == slow_runner
            return true
        end
    end

    # case: fast_runner hit the end of the list
    return false
end