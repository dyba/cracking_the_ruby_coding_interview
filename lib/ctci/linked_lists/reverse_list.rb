module CTCI
  module LinkedLists
    # TODO: Keep 'list' unchanged
    def reverse_list list
      reversed = nil
      cloned = list

      while cloned do
        front, rest = cloned, cloned.next
        front.next = nil

        if reversed
          front.next = reversed
        end

        reversed = front
        cloned = rest
      end

      reversed
    end
  end
end
