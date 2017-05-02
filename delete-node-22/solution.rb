  class LinkedListNode

    attr_accessor :value, :next

    def initialize(value)
        @value = value
        @next  = nil
    end
end

def delete_node(node_to_delete)

    # get the input node's next node, the one we want to skip to
    next_node = node_to_delete.next

    if next_node

        # replace the input node's value and pointer with the next
        # node's value and pointer. the previous node now effectively
        # skips over the input node
        node_to_delete.value = next_node.value
        node_to_delete.next  = next_node.next

    else

        # eep, we're trying to delete the last node!
        raise "Can't delete the last node with this method!"
    end
end

a = LinkedListNode.new('A')
b = LinkedListNode.new('B')
c = LinkedListNode.new('C')

a.next = b
b.next = c

delete_node(b)