module CTCI
  module DataStructures
    class TreeNode
      attr_accessor :right, :left, :value

      def initialize(value)
        @value = value
      end

      def to_s
        "[ #{value} | right: #{right.nil? ? 'nil' : right.to_s}, left: #{left.nil? ? 'nil' : left.to_s}]"
      end
    end
  end
end
