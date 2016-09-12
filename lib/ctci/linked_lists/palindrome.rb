require 'ctci/data_structures/stack'

module CTCI
  module LinkedLists

    def palindrome? list
      return false unless list

      runner = list
      reversed = nil

      while runner do
        if reversed
          front = ::CTCI::DataStructures::SinglyLinkedNode.new(runner.value)
          front.next = reversed
          reversed = front
        else
          reversed = ::CTCI::DataStructures::SinglyLinkedNode.new(runner.value)
        end

        runner = runner.next
      end

      runner = list

      while reversed do
        return false if reversed.value != runner.value
        reversed = reversed.next
        runner = runner.next
      end

      true
    end
  end
end
