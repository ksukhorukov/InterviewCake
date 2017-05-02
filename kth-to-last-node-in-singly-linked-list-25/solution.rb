  class LinkedListNode

    attr_accessor :value, :next

    def initialize(value)
        @value = value
        @next  = nil
    end
end

  def kth_to_last_node(k, head)

    if k < 1
        raise ArgumentError, "Impossible to find less than first to last node: #{k}"
    end

    left_node  = head
    right_node = head

    # move right_node to the kth node
    (0...k - 1).each do |x|

        # but along the way, if a right_node doesn't have a next,
        # then k is greater than the length of the list and there
        # can't be a kth-to-last node! we'll raise an error
        if !right_node.next
            raise ArgumentError, "k is larger than the length of the linked list: #{k}"
        end

        right_node = right_node.next
    end

    # starting with left_node on the head,
    # move left_node and right_node down the list,
    # maintaining a distance of k between them,
    # until right_node hits the end of the list
    while right_node.next
        left_node  = left_node.next
        right_node = right_node.next
    end

    # since left_node is k nodes behind right_node,
    # left_node is now the kth to last node!
    return left_node
end

a = LinkedListNode.new("Angel Food")
b = LinkedListNode.new("Bundt")
c = LinkedListNode.new("Cheese")
d = LinkedListNode.new("Devil's Food")
e = LinkedListNode.new("Eccles")

a.next = b
b.next = c
c.next = d
d.next = e

kth_to_last_node(2, a)

