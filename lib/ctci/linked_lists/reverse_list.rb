module CTCI
  module LinkedLists
    def reverse_list list
      reversed = nil
      original = list

      while original do
        head, rest = original, original.next
        head.next = nil

        if reversed
          head.next = reversed
        end

        reversed = head
        original = rest
      end

      reversed
    end
  end
end
