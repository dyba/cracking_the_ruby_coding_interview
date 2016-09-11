module CTCI
  module DataStructures
    class Q
      class EmptyQueueException < Exception; end

      class Node
        attr_accessor :value, :next, :previous

        def initialize(value)
          @value = value
        end
      end

      def initialize
        @head = nil
      end

      def add(value)
        if @head.nil?
          first = Node.new(value)
          @head = first
          @tail = first
        else
          front = Node.new(value)
          front.next = @head
          @head.previous = front
          @head = front
        end
      end

      def remove
        raise EmptyQueueException, "Can't remove from an empty queue" unless @tail

        removed = @tail
        back = @tail.previous

        if back.nil?
          @head = nil
        else
          back.next = nil
        end

        @tail = back
        removed.value
      end

      def peek
        raise EmptyQueueException, "Can't peek an empty queue" unless @tail
        @tail.value
      end

      def empty?
        @head.nil? && @tail.nil?
      end
    end
  end
end
