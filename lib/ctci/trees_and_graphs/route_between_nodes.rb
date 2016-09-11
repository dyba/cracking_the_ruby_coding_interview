require 'ctci/data_structures/graph_node'
require 'ctci/data_structures/queue'

module CTCI
  module TreesAndGraphs
    def route_exists? source_node, dest_node
      queue = ::CTCI::DataStructures::Q.new
      queue.add source_node

      until queue.empty? do
        node = queue.remove
        return true if node.value == dest_node.value
        node.nodes.each do |n|
          unless n.visited
            n.visited = true
            queue.add n
          end
        end
      end

      false
    end
  end
end
