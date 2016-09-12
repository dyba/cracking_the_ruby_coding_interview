require 'ctci/data_structures/singly_linked_node'

module CTCI
  module DataStructures
    class Stack
      class EmptyStackException < Exception; end

      attr_reader :head

      def push(value)
        if @head
          top = ::CTCI::DataStrutures::SinglyLinkedNode.new(value)
          top.next = @head
          @head = top
        else
          @head = ::CTCI::DataStructures::SinglyLinkedNode.new(value)
        end
      end

      def pop
        if @head
          top = @head.value
          @head = @head.next
          top
        else
          raise EmptyStackException, "Can't pop empty stack"
        end
      end

      def peek
        if @head
          @head.value
        else
          raise EmptyStackException, "Can't peek an empty stack"
        end
      end

      def empty?
        @head.nil?
      end
    end
  end
end
