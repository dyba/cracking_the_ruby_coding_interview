module CTCI
  module DataStructures
    class GraphNode
      attr_accessor :value, :nodes, :visited

      def initialize(value)
        @value = value
        @nodes = []
        @visited = false
      end
    end
  end
end
