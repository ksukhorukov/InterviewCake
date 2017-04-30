  def find_largest(root_node)
    current = root_node
    while current
        return current.value if !current.right
        current = current.right
    end
end

def find_second_largest(root_node)
    if !root_node || (!root_node.left && !root_node.right)
        raise Exception, 'Tree must have at least 2 nodes'
    end

    current = root_node

    while current
        # case: current is largest and has a left subtree
        # 2nd largest is the largest in that subtree
        if current.left && !current.right
            return find_largest(current.left)
        end

        # case: current is parent of largest, and largest has no children,
        # so current is 2nd largest
        if current.right && \
                !current.right.left && \
                !current.right.right
            return current.value
        end

        current = current.right
    end
end