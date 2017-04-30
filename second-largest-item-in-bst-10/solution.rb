#!/usr/bin/env ruby

require 'pp'

class BinaryTreeNode
  
  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    @right
  end

end

def second_largest_item(tree)
  values = []
  nodes = [tree]
  while !nodes.empty?
    node = nodes.pop
    values << node.value
    nodes << node.left if node.left
    nodes << node.right if node.right
  end
  values.sort[-2]
end

tree = BinaryTreeNode.new(100)
tree.insert_left(200)
tree.insert_right(300)

puts second_largest_item(tree)