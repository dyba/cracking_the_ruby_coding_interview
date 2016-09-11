require 'ctci/data_structures/tree_node'

module CTCI
  module TreesAndGraphs
    def minimal_tree array
      return nil unless array
      return nil if array.empty?

      midpoint = (array.size - 1) / 2

      node = ::CTCI::DataStructures::TreeNode.new(array[midpoint])

      node.left = minimal_tree(array[0, midpoint])
      node.right = minimal_tree(array[midpoint + 1, array.size])

      node
    end
  end
end
