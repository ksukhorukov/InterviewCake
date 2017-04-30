  def is_binary_search_tree(root, lower_bound=-Float::INFINITY, upper_bound=Float::INFINITY)
    if not root
        return true
    end

    if (root.value >= upper_bound || root.value <= lower_bound)
        return false
    end

    return is_binary_search_tree(root.left, lower_bound, root.value) \
        && is_binary_search_tree(root.right, root.value, upper_bound)
end