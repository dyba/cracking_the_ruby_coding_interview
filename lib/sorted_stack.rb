require 'stack'

module SortedStack
  def sorted_stack(stack)
    sorted = Stack.new

    until stack.empty? do
      top = stack.pop
      if sorted.empty?
        sorted.push top
        next
      end

      while !sorted.empty? && top > sorted.peek do
        stack.push sorted.pop
      end

      sorted.push top
    end

    sorted
  end
end
