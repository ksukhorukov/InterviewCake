#!/usr/bin/env ruby

  class LinkedListNode

    attr_accessor :value, :next

    def initialize(value)
        @value = value
        @next  = nil
    end
end

  def reverse(head_of_list)
    current = head_of_list
    previous = nil
    next_node = nil

    # until we have 'fallen off' the end of the list
    while current

        # copy a pointer to the next element
        # before we overwrite current.next
        next_node = current.next

        # reverse the 'next' pointer
        current.next = previous

        # step forward in the list
        previous = current
        current = next_node
    end

    return previous
end